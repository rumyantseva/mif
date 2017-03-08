package middleware

import (
	"net/http"

	"github.com/gorilla/context"
	"github.com/julienschmidt/httprouter"
	"github.com/rumyantseva/mif/models"
	"gopkg.in/reform.v1"
)

// Authorize middleware: check authorization, save user in context and move request to given handler.
func (mw *MW) Authorize(h httprouter.Handle) httprouter.Handle {
	return func(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
		token := r.URL.Query().Get("token")

		// Insecure (too short) tokens are not supported
		if len(token) < 10 {
			mw.errorAuth(w)
			return
		}

		st, err := mw.db.FindOneFrom(models.UserTable, "token", token)
		if err == reform.ErrNoRows {
			mw.errorAuth(w)
			return
		}
		if err != nil {
			mw.errorServer(w)
			return
		}

		user := st.(*models.User)
		mw.setUser(r, user)

		// Just move request to the given handle
		h(w, r, ps)
	}
}

// errorAuth makes error in case of wrong authorization token.
func (mw *MW) errorAuth(w http.ResponseWriter) {
	mw.makeError(w, http.StatusUnauthorized, "Authorization token is not set or incorret.")
}

// setUser add user to the context of given request.
func (mw *MW) setUser(r *http.Request, u *models.User) {
	mw.log.Debugf("Set user to request context: %+v", u)
	context.Set(r, "user", u)
}

// getUser get user from the context of given request.
func (mw *MW) getUser(r *http.Request) *models.User {
	data := context.Get(r, "user")
	mw.log.Debugf("Get user from request context: %+v", data)
	return data.(*models.User)
}
