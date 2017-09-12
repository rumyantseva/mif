package middleware

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/julienschmidt/httprouter"
	"gopkg.in/reform.v1"

	"github.com/rumyantseva/mif/models"
)

// LibraryRequest describes common ADD / DELETE request for user library.
type LibraryRequest struct {
	BookID int    `json:"book_id"`
	Type   string `json:"type"`
}

// AddToLibrary saves given book to the library of current user.
func (mw *MW) AddToLibrary(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	request, err := mw.libraryRequest(w, r)
	if err != nil {
		return
	}

	user := mw.getUser(r)
	if user == nil {
		mw.log.Errorf("Couldn't get user from the context of request.")
		mw.errorServer(w)
		return
	}

	// Check if user doesn't have this book in their library
	query := "JOIN volumes v ON v.id = library.volume_id " +
		" WHERE library.user_id = " + mw.db.Placeholder(1) +
		" AND v.type = " + mw.db.Placeholder(2) + " AND v.book_id = " + mw.db.Placeholder(3)
	_, err = mw.db.SelectOneFrom(models.LibraryTable, query, user.ID, request.Type, request.BookID)
	if err != nil && err != reform.ErrNoRows {
		mw.log.Errorf("Couldn't get data from DB for library: %s", err.Error())
		mw.errorServer(w)
		return
	}
	if err == nil {
		mw.makeError(w, http.StatusBadRequest, "Book already exists in the library of current user.")
		return
	}

	// Check if book and volume exist
	query = "WHERE type = " + mw.db.Placeholder(1) + " AND book_id = " + mw.db.Placeholder(2)
	st, err := mw.db.SelectOneFrom(models.VolumeTable, query, request.Type, request.BookID)
	if err != nil && err != reform.ErrNoRows {
		mw.log.Errorf("Couldn't get data from DB for library: %s", err.Error())
		mw.errorServer(w)
		return
	}
	if err == reform.ErrNoRows {
		mw.makeError(w, http.StatusBadRequest, "Couldn't find volume of the given type and book ID.")
		return
	}

	volume := st.(*models.Volume)

	libItem := &models.Library{
		UserID:   user.ID,
		VolumeID: volume.ID,
	}
	err = mw.db.Insert(libItem)
	if err != nil {
		mw.log.Errorf("Couldn't save book to the library: %s.", err.Error())
		mw.errorServer(w)
		return
	}

	mw.makeDataBody(w, http.StatusCreated, libItem, nil)
}

// DeleteFromLibrary drop given book from the library of current user.
func (mw *MW) DeleteFromLibrary(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	request, err := mw.libraryRequest(w, r)
	if err != nil {
		return
	}

	user := mw.getUser(r)
	if user == nil {
		mw.log.Errorf("Couldn't get user from the context of request.")
		mw.errorServer(w)
		return
	}

	// Check if user have this book in their library
	query := "JOIN volumes v ON v.id = library.volume_id " +
		" WHERE library.user_id = " + mw.db.Placeholder(1) +
		" AND v.type = " + mw.db.Placeholder(2) + " AND v.book_id = " + mw.db.Placeholder(3)
	st, err := mw.db.SelectOneFrom(models.LibraryTable, query, user.ID, request.Type, request.BookID)
	if err == reform.ErrNoRows {
		mw.makeError(w, http.StatusBadRequest, "Book is not exist in the library of current user.")
		return
	}
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for library: %s", err.Error())
		mw.errorServer(w)
		return
	}

	item := st.(*models.Library)
	err = mw.db.Delete(item)
	if err != nil {
		mw.log.Errorf("Couldn't delete book from the library: %s.", err.Error())
		mw.errorServer(w)
		return
	}

	mw.noContent(w)
}

// Library returns the library of current user.
func (mw *MW) Library(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	request := struct {
		limit  int
		offset int
	}{
		limit:  10,
		offset: 0,
	}

	limit := r.URL.Query().Get("limit")
	if len(limit) > 0 {
		numLim, err := strconv.Atoi(limit)
		if err != nil || numLim <= 0 {
			mw.makeError(w, http.StatusBadRequest, "Limit must be integer between 1 and 100.")
			return
		}

		if numLim > 100 {
			mw.makeError(w, http.StatusBadRequest, "Limit must be integer between 1 and 100.")
			return
		}

		request.limit = numLim
	}

	offset := r.URL.Query().Get("offset")
	if len(offset) > 0 {
		numOffset, err := strconv.Atoi(offset)
		if err != nil || numOffset < 0 {
			mw.makeError(w, http.StatusBadRequest, "Offset must be non-negative integer.")
			return
		}

		request.offset = numOffset
	}

	user := mw.getUser(r)
	if user == nil {
		mw.log.Errorf("Couldn't get user from the context of request.")
		mw.errorServer(w)
		return
	}

	columns := []string{
		"library.id", "library.volume_id", "library.created_at", "library.updated_at",
		"volumes.book_id", "volumes.type", "books.title", "books.authors",
	}
	condition := " JOIN volumes ON volumes.id = library.volume_id " +
		"JOIN books ON books.id = volumes.book_id " +
		"WHERE library.user_id = $1 "

	query := "SELECT " + strings.Join(columns, ",") + " FROM library " +
		condition + "ORDER BY library.id DESC " +
		fmt.Sprintf("LIMIT %d OFFSET %d ", request.limit, request.offset)
	rows, err := mw.db.Query(query, user.ID)
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for library: %s", err.Error())
		mw.errorServer(w)
		return
	}

	type Item struct {
		ID        int       `json:"id"`
		VolumeID  int       `json:"volume_id"`
		Type      string    `json:"type"`
		BookID    int       `json:"book_id"`
		Title     string    `json:"title"`
		Authors   string    `json:"authors"`
		CreatedAt time.Time `json:"created_at"`
		UpdatedAt time.Time `json:"updated_at"`
	}
	var data []Item
	for rows.Next() {
		var id, volumeID, bookID int
		var volume, title, authors string
		var createdAt, updatedAt time.Time

		err = rows.Scan(&id, &volumeID, &createdAt, &updatedAt, &bookID, &volume, &title, &authors)
		if err != nil {
			mw.log.Errorf("Couldn't get data from DB for library: %s", err.Error())
			mw.errorServer(w)
			return
		}
		item := Item{
			ID:        id,
			VolumeID:  volumeID,
			Type:      volume,
			BookID:    bookID,
			Title:     title,
			Authors:   authors,
			CreatedAt: createdAt,
			UpdatedAt: updatedAt,
		}
		data = append(data, item)
	}
	err = rows.Err()
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for library: %s", err.Error())
		mw.errorServer(w)
		return
	}

	// Total amount of books for the library
	var total int
	query = "SELECT COUNT(books.*) FROM " + models.LibraryTable.Name() + condition
	err = mw.db.QueryRow(query, user.ID).Scan(&total)
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

	mw.makeDataBody(w, http.StatusOK, data, meta)
}

// libraryRequest checks body of http request and makes LibraryRequest item.
func (mw *MW) libraryRequest(w http.ResponseWriter, r *http.Request) (*LibraryRequest, error) {
	var request *LibraryRequest
	err := json.NewDecoder(r.Body).Decode(&request)
	if err != nil {
		mw.makeError(w, http.StatusBadRequest, "Couldn't parse request body.")
		return nil, err
	}

	if request.BookID <= 0 {
		mw.makeError(w, http.StatusBadRequest, "Book ID must be positive integer.")
		return nil, fmt.Errorf("Book ID %d is incrorrect.", request.BookID)
	}

	if models.CheckVolume(request.Type) == false {
		msg := "Volume type is wrong. Possible values are: " + strings.Join(models.GetVolumes(), ", ")
		mw.makeError(w, http.StatusBadRequest, msg)
		return nil, fmt.Errorf("Volume type %s is incrorrect.", request.Type)
	}

	mw.log.Debugf("The request is: %+v", request)
	return request, nil
}
