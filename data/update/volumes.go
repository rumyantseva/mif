package main

import (
	"bufio"
	"database/sql"
	"encoding/csv"
	"io"
	"os"

	"github.com/Sirupsen/logrus"
	_ "github.com/lib/pq"
	"github.com/rumyantseva/mif/models"
	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/dialects/postgresql"
)

func main() {
	log := logrus.New()

	conn, err := sql.Open(
		"postgres",
		"postgres://postgres:mysecretpassword@localhost:5432/mifbooks?sslmode=disable",
	)
	if err != nil {
		log.Fatal(err)
	}

	DB := reform.NewDB(
		conn,
		postgresql.Dialect,
		reform.NewPrintfLogger(log.Printf),
	)

	volumeType := "audiobook"

	//f, err := os.Open("../parse/links_paper.txt")
	//f, err := os.Open("../parse/links_ebook.txt")
	//f, err := os.Open("../parse/links_audiobook.txt")
	f, err := os.Open("../parse/links_white.txt")
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
			Type: volumeType,
		}
		DB.Save(volume)

		total++
	}

	log.Infof("Found and saved %d new volumes.", total)
}
