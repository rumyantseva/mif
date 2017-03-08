package middleware

import (
	"github.com/Sirupsen/logrus"
	"gopkg.in/reform.v1"
)

// MW defines service which dependent on database.
type MW struct {
	db  *reform.DB
	log *logrus.Logger
}

// New returns new instance of MW service.
func New(db *reform.DB, logger *logrus.Logger) *MW {
	return &MW{
		db:  db,
		log: logger,
	}
}
