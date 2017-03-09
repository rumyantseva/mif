package main

import (
	"bufio"
	"encoding/csv"
	"io"
	"os"

	"github.com/Sirupsen/logrus"
	"github.com/rumyantseva/mif/models"
	"github.com/rumyantseva/mif/utils"
	"gopkg.in/reform.v1"
)

// How to run:
// env DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks go run volumes.go
func main() {
	log := logrus.New()

	DB, err := utils.StartupDB()
	if err != nil {
		log.Fatal(err)
	}

	f, err := os.Open("../link-list/links.txt")
	if err != nil {
		log.Fatal(err)
	}

	total := 0

	r := csv.NewReader(bufio.NewReader(f))

	// Read rows from file
	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		book := &models.Book{}

		volumeType := record[0]
		// Check if book with URL exists
		bookURL := record[1]

		st, err := DB.FindOneFrom(models.BookTable, "url", bookURL)

		if err != nil {
			logrus.Fatal(err)
		}

		book = st.(*models.Book)

		_, err = DB.SelectOneFrom(models.VolumeTable, "WHERE book_id = $1 AND type = $2", book.ID, volumeType)

		if err != nil && err != reform.ErrNoRows {
			logrus.Fatal(err)
		}

		// If we already have this entry
		if err == nil {
			continue
		}

		volume := &models.Volume{
			BookID: book.ID,
			Type:   volumeType,
		}
		DB.Save(volume)

		total++
	}

	log.Infof("Found and saved %d new volumes.", total)
}
