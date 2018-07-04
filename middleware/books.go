package middleware

import (
	"fmt"
	"net/http"
	"regexp"
	"strconv"
	"strings"

	"github.com/AlekSi/pointer"
	"github.com/julienschmidt/httprouter"
	"gopkg.in/reform.v1"

	"github.com/rumyantseva/mif/models"
)

// SearchBooksRequest describes parameters of books searching request.
type SearchBooksRequest struct {
	mifID  *int
	volume *string
	search *string
	categoryId *int
	author *string
	limit  int
	offset int
}

// SingleBook finds book from database by its id with volumes available for this book.
func (mw *MW) SingleBook(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
	bookID, err := strconv.Atoi(p.ByName("id"))

	if err != nil || bookID <= 0 {
		mw.log.Info(bookID)
		mw.makeError(w, http.StatusBadRequest, "Book ID must be positive integer.")
		return
	}

	st, err := mw.db.FindByPrimaryKeyFrom(models.BookTable, bookID)
	if err != nil && err != reform.ErrNoRows {
		mw.log.Errorf("Couldn't get data from DB for book: %s", err.Error())
		mw.errorServer(w)
		return
	}
	if err == reform.ErrNoRows {
		mw.makeError(w, http.StatusNotFound, "Book is not found.")
		return
	}

	book := st.(*models.Book)

	// Additional information: book volumes
	sts, err := mw.db.FindAllFrom(models.VolumeTable, "book_id", book.ID)
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for book's volumes: %s", err.Error())
		mw.errorServer(w)
		return
	}

	var volumes []string
	for _, st := range sts {
		volume := st.(*models.Volume)
		volumes = append(volumes, volume.Type)
	}
	book.Volumes = volumes

	mw.makeDataBody(w, http.StatusOK, book, nil)
}

// SearchBooks finds multiple books by the given search criteria.
func (mw *MW) SearchBooks(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	request := mw.searchBooksRequest(r, w)
	if request == nil {
		return
	}

	sel := ""
	var conditions []string
	var args []interface{}

	ind := 1

	if request.mifID != nil {
		conditions = append(conditions, "books.mif_id = "+mw.db.Placeholder(ind))
		args = append(args, *request.mifID)
		ind++
	}

	if request.search != nil {
		conditions = append(conditions, "books.title ILIKE "+mw.db.Placeholder(ind))
		args = append(args, *request.search)
		ind++
	}

	if request.categoryId != nil {
		conditions = append(conditions, "books.category_id = "+mw.db.Placeholder(ind))
		args = append(args, *request.categoryId)
		ind++
	}

	if request.author != nil {
		conditions = append(conditions, "books.authors ILIKE "+mw.db.Placeholder(ind))
		args = append(args, *request.author)
		ind++
	}

	join := ""
	if request.volume != nil {
		join = " JOIN volumes v ON v.book_id = books.id "
		conditions = append(conditions, "v.type = "+mw.db.Placeholder(ind))
		args = append(args, *request.volume)
	}

	order := fmt.Sprintf(" ORDER BY books.id DESC LIMIT %d OFFSET %d", request.limit, request.offset)

	where := " WHERE is_visible = true "
	if len(conditions) > 0 {
		where += "AND " + strings.Join(conditions, " AND ")
	}

	query := sel + join + where + order

	sts, err := mw.db.SelectAllFrom(models.BookTable, query, args...)
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for books: %s", err.Error())
		mw.errorServer(w)
		return
	}

	var books []*models.Book
	for _, st := range sts {
		book := st.(*models.Book)
		books = append(books, book)
	}

	// Total amount of books for the request
	var total int
	query = "SELECT COUNT(books.*) FROM " + models.BookTable.Name() + join + where
	err = mw.db.QueryRow(query, args...).Scan(&total)
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for books total count: %s", err.Error())
		mw.errorServer(w)
		return
	}

	meta := struct {
		Total  int `json:"total"`
		Limit  int `json:"limit"`
		Offset int `json:"offset"`
	}{
		Limit:  request.limit,
		Offset: request.offset,
		Total:  total,
	}
	mw.makeDataBody(w, http.StatusOK, books, meta)
}

// searchBooksRequest checks http request and makes SearchBooksRequest item.
func (mw *MW) searchBooksRequest(r *http.Request, w http.ResponseWriter) *SearchBooksRequest {
	request := &SearchBooksRequest{
		mifID:  nil,
		volume: nil,
		search: nil,
		categoryId: nil,
		author: nil,
		limit:  10,
		offset: 0,
	}

	mifID := strings.Trim(r.URL.Query().Get("mif_id"), " ")
	if len(mifID) > 0 {
		numID, err := strconv.Atoi(mifID)
		if err != nil {
			mw.makeError(w, http.StatusBadRequest, "MIF ID must be positive integer.")
			return nil
		}

		request.mifID = pointer.ToInt(numID)
	}

	volume := strings.Trim(r.URL.Query().Get("type"), " ")
	if len(volume) > 0 {
		possible := models.CheckVolume(volume)
		if !possible {
			msg := "Volume type is wrong. Possible values are: " + strings.Join(models.GetVolumes(), ", ")
			mw.makeError(w, http.StatusBadRequest, msg)
			return nil
		}
		request.volume = pointer.ToString(volume)
	}

	search := clearWhitespaces(r.URL.Query().Get("search"))
	if len(search) > 0 {
		request.search = pointer.ToString("%" + search + "%")
	}

	categoryId := clearWhitespaces(r.URL.Query().Get("category_id"))
	if len(categoryId) > 0 {
		numID, err := strconv.Atoi(categoryId)
		if err != nil {
			mw.makeError(w, http.StatusBadRequest, "Category Id must be positive integer.")
			return nil
		}

		request.categoryId = pointer.ToInt(numID)
	}

	author := clearWhitespaces(r.URL.Query().Get("author"))
	if len(author) > 0 {
		request.author = pointer.ToString("%" + author + "%")
	}

	limit := strings.Trim(r.URL.Query().Get("limit"), " ")
	if len(limit) > 0 {
		numLim, err := strconv.Atoi(limit)
		if err != nil || numLim <= 0 {
			mw.makeError(w, http.StatusBadRequest, "Limit must be integer between 1 and 100.")
			return nil
		}

		if numLim > 100 {
			mw.makeError(w, http.StatusBadRequest, "Limit must be integer between 1 and 100.")
			return nil
		}

		request.limit = numLim
	}

	offset := strings.Trim(r.URL.Query().Get("offset"), " ")
	if len(offset) > 0 {
		numOffset, err := strconv.Atoi(offset)
		if err != nil || numOffset < 0 {
			mw.makeError(w, http.StatusBadRequest, "Offset must be non-negative integer.")
			return nil
		}

		request.offset = numOffset
	}

	return request
}

// clearWhitespaces removes extra whitespaces from the given string.
func clearWhitespaces(s string) string {
	s = strings.Trim(s, " ")
	re := regexp.MustCompile(`\s{2,}`)
	s = re.ReplaceAllString(s, " ")
	return s
}
