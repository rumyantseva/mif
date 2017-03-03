package models

import (
	"time"
)

// List of possible "volumes" (book types)
const (
	VolumePaper   = "paperbook"
	VolumeElectro = "ebook"
	VolumeAudio   = "audiobook"
)

// GetVolumes returns list of possible "volumes" (book types)
func GetVolumes() []string {
	volumes := []string{VolumePaper, VolumeElectro, VolumeAudio}
	return volumes
}

//go:generate reform

//reform:volumes
type Volume struct {
	ID        int32     `reform:"id,pk"`
	BookID    int32     `reform:"book_id"`
	Type      string    `reform:"type"`
	CreatedAt time.Time `reform:"created_at"`
	UpdatedAt time.Time `reform:"updated_at"`
}

// BeforeInsert set CreatedAt and UpdatedAt.
func (v *Volume) BeforeInsert() error {
	v.CreatedAt = time.Now().UTC().Truncate(time.Second)
	v.UpdatedAt = v.CreatedAt
	return nil
}

// BeforeUpdate set UpdatedAt.
func (v *Volume) BeforeUpdate() error {
	v.UpdatedAt = time.Now().UTC().Truncate(time.Second)
	return nil
}
