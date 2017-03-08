package models

import "time"

//go:generate reform

//reform:library
type Library struct {
	ID        int32     `reform:"id,pk" json:"id"`
	UserID    int32     `reform:"user_id" json:"-"`
	VolumeID  int32     `reform:"volume_id" json:"volume_id"`
	CreatedAt time.Time `reform:"created_at" json:"created_at"`
	UpdatedAt time.Time `reform:"updated_at" json:"updated_at"`
}

// BeforeInsert set CreatedAt and UpdatedAt.
func (l *Library) BeforeInsert() error {
	l.CreatedAt = time.Now().UTC().Truncate(time.Second)
	l.UpdatedAt = l.CreatedAt
	return nil
}

// BeforeUpdate set UpdatedAt.
func (l *Library) BeforeUpdate() error {
	l.UpdatedAt = time.Now().UTC().Truncate(time.Second)
	return nil
}
