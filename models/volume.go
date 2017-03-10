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
	volumes := []string{VolumeAudio, VolumeElectro, VolumePaper}
	return volumes
}

// CheckVolume checks if the given volume is supported
func CheckVolume(volume string) bool {
	switch volume {
	case VolumePaper:
	case VolumeElectro:
	case VolumeAudio:
	default:
		return false
	}
	return true
}

//go:generate reform

// Volume describes "type" of book - paperbook, ebook or audiobook.
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
