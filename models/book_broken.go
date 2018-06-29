package models

import "time"

//go:generate reform

// Book describes a broken (not recognizable) book.
//reform:books_broken
type BookBroken struct {
	ID        int32     `reform:"id,pk" json:"id"`
	URL       string    `reform:"url" json:"url"`
	CreatedAt time.Time `reform:"created_at" json:"created_at"`
	UpdatedAt time.Time `reform:"updated_at" json:"updated_at"`
}

// BeforeInsert set CreatedAt and UpdatedAt.
func (b *BookBroken) BeforeInsert() error {
	b.CreatedAt = time.Now().UTC().Truncate(time.Second)
	b.UpdatedAt = b.CreatedAt
	return nil
}

// BeforeUpdate set UpdatedAt.
func (b *BookBroken) BeforeUpdate() error {
	b.UpdatedAt = time.Now().UTC().Truncate(time.Second)
	return nil
}
