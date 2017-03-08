package middleware

import (
	"encoding/json"
	"net/http"
)

// Response defines common block of API response.
type Response struct {
	Data  interface{}    `json:"data,omitempty"`
	Meta  interface{}    `json:"meta,omitempty"`
	Error *ResponseError `json:"error,omitempty"`
}

// ResponseError defines error block of API response.
type ResponseError struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
}

// errorServer makes error in case of internal server error.
func (mw *MW) errorServer(w http.ResponseWriter) {
	mw.makeError(w, http.StatusInternalServerError, "Something went wrong. We will repair it as soon as possible.")
}

// makeError makes custom error by given code and message.
func (mw *MW) makeError(w http.ResponseWriter, code int, message string) {
	respErr := &ResponseError{
		Code:    code,
		Message: message,
	}

	resp := &Response{
		Error: respErr,
		Data:  nil,
	}

	mw.writeResponse(w, code, resp)
}

// makeDataBody makes custom body in case of success response.
func (mw *MW) makeDataBody(w http.ResponseWriter, code int, data interface{}, meta interface{}) {
	resp := &Response{
		Data:  data,
		Meta:  meta,
		Error: nil,
	}

	mw.writeResponse(w, code, resp)
}

// writeResponse makes response by given Response item.
func (mw *MW) writeResponse(w http.ResponseWriter, code int, resp *Response) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(code)

	err := json.NewEncoder(w).Encode(resp)
	if err != nil {
		mw.log.Errorf("Couldn't encode response %+v to HTTP response body.", resp)
		http.Error(w, http.StatusText(http.StatusInternalServerError), http.StatusInternalServerError)
	}
}

// noContent makes "no content" response - without body.
func (mw *MW) noContent(w http.ResponseWriter) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(http.StatusNoContent)
}
