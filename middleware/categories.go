package middleware

import (
	"net/http"
	"github.com/julienschmidt/httprouter"
	"github.com/rumyantseva/mif/models"
	"fmt"
	"strconv"
	"strings"
	"github.com/AlekSi/pointer"
)

// SearchCategoryRequest describes parameters of categories searching request.
type SearchCategoryRequest struct {
	title *string
	limit  int
	offset int
}

func (mw *MW) SearchCategories(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
	request := mw.searchCategoriesRequest(r, w)
	if request == nil {
		return
	}

	var args []interface{}

	where := ""
	if request.title != nil {
		where += " WHERE Title ILIKE " + mw.db.Placeholder(1)
		args = append(args, *request.title)
	}

	order := fmt.Sprintf(" ORDER BY Title ASC LIMIT %d OFFSET %d", request.limit, request.offset)
	query := where + order

	sts, err := mw.db.SelectAllFrom(models.CategoryTable, query, args...)
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for categories: %s", err.Error())
		mw.errorServer(w)
		return
	}

	var categories []*models.Category
	for _, st := range sts {
		category := st.(*models.Category)
		categories = append(categories, category)
	}

	// Total amount of categories for the request
	var total int
	query = "SELECT COUNT(categories.*) FROM " + models.CategoryTable.Name()
	err = mw.db.QueryRow(query).Scan(&total)
	if err != nil {
		mw.log.Errorf("Couldn't get data from DB for categories total count: %s", err.Error())
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

	mw.makeDataBody(w, http.StatusOK, categories, meta)
}

// searchCategoriesRequest checks http request and makes SearchCategoryRequest item.
func (mw *MW) searchCategoriesRequest(r *http.Request, w http.ResponseWriter) *SearchCategoryRequest {
	request := &SearchCategoryRequest{
		title: nil,
		limit:  10,
		offset: 0,
	}

	title := clearWhitespaces(r.URL.Query().Get("title"))
	if len(title) > 0 {
		request.title = pointer.ToString("%" + title + "%")
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
