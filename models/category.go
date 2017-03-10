package models

import (
	"time"
)

//go:generate reform

// Category describes book category.
//reform:categories
type Category struct {
	ID        int32     `reform:"id,pk"`
	Title     string    `reform:"title"`
	CreatedAt time.Time `reform:"created_at"`
	UpdatedAt time.Time `reform:"updated_at"`
}

// BeforeInsert set CreatedAt and UpdatedAt.
func (c *Category) BeforeInsert() error {
	c.CreatedAt = time.Now().UTC().Truncate(time.Second)
	c.UpdatedAt = c.CreatedAt
	return nil
}

// BeforeUpdate set UpdatedAt.
func (c *Category) BeforeUpdate() error {
	c.UpdatedAt = time.Now().UTC().Truncate(time.Second)
	return nil
}
