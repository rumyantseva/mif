package models

import "time"

//go:generate reform

//reform:books
type Book struct {
	ID         int32     `reform:"id,pk" json:"id"`
	MIFID      *int32    `reform:"mif_id" json:"mif_id"`
	CategoryID *int32    `reform:"category_id" json:"category_id"`
	Title      *string   `reform:"title" json:"title"`
	ISBN       *string   `reform:"isbn" json:"isbn"`
	Authors    *string   `reform:"authors" json:"authors"`
	URL        string    `reform:"url" json:"url"`
	CreatedAt  time.Time `reform:"created_at" json:"created_at"`
	UpdatedAt  time.Time `reform:"updated_at" json:"updated_at"`
	IsVisible  bool      `reform:"is_visible" json:"-"`
	Volumes    []string  `json:"volumes,omitempty"`
}

// BeforeInsert set CreatedAt and UpdatedAt.
func (b *Book) BeforeInsert() error {
	b.CreatedAt = time.Now().UTC().Truncate(time.Second)
	b.UpdatedAt = b.CreatedAt
	b.IsVisible = true
	return nil
}

// BeforeUpdate set UpdatedAt.
func (b *Book) BeforeUpdate() error {
	b.UpdatedAt = time.Now().UTC().Truncate(time.Second)
	return nil
}
