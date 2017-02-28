package models

import "time"

//go:generate reform

//reform:book
type Book struct {
	ID        int32      `reform:"id,pk"`
	Title      string     `reform:"title"`
	ISBN      string     `reform:"isbn"`
	Authors      string     `reform:"authors"`
	Description      string     `reform:"description"`
	URL      string     `reform:"url"`
	Picture      string     `reform:"picture"`
	Year      int16     `reform:"year"`
	CreatedAt time.Time  `reform:"created_at"`
	UpdatedAt time.Time `reform:"updated_at"`
}
