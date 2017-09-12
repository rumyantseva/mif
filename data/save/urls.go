package main

import (
	"bufio"
	"encoding/csv"
	"io"
	"os"

	"github.com/Sirupsen/logrus"
	"gopkg.in/reform.v1"

	"github.com/rumyantseva/mif/models"
	"github.com/rumyantseva/mif/utils"
)

// How to run:
// env DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks go run urls.go
func main() {
	log := logrus.New()

	DB, err := utils.StartupDB()
	if err != nil {
		log.Fatal(err)
	}

	sources := []string{"links_white.txt", "links_sitemap.txt", "links.txt"}

	total := 0

	for _, src := range sources {
		f, err := os.Open("../link-list/" + src)
		if err != nil {
			log.Fatal(err)
		}

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

			if err != nil && err != reform.ErrNoRows {
				logrus.Fatal(err)
			}

			if err == nil {
				book = st.(*models.Book)
			}
			// ---

			book.URL = bookURL

			DB.Save(book)
			total++
		}
	}

	log.Infof("Found and saved %d URLs.", total)
}
