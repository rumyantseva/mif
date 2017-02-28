package models

import "time"

//go:generate reform

//reform:category
type Category struct {
	ID        int32      `reform:"id,pk"`
	Title      string     `reform:"title"`
	CreatedAt time.Time  `reform:"created_at"`
	UpdatedAt time.Time `reform:"updated_at"`
}
