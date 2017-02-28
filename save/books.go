package main

import (
	"bufio"
	"database/sql"
	"encoding/csv"
	"io"
	"os"
	"strconv"

	"github.com/AlekSi/pointer"
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

	f, err := os.Open("../import/books.csv")
	if err != nil {
		log.Fatal(err)
	}

	total := 0

	r := csv.NewReader(bufio.NewReader(f))

	// Skip first row
	_, err = r.Read()
	if err == io.EOF {
		log.Fatal("The file is empty.")
	}

	// Read rows from file
	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		book := &models.Book{}

		// Check if book with URL exists
		bookURL := record[5]

		if len(bookURL) == 0 {
			logrus.Fatalf("Book %s doesn't have URL!", record[0])
		}

		st, err := DB.FindOneFrom(models.BookTable, "url", bookURL)

		if err != nil && err != reform.ErrNoRows {
			logrus.Fatal(err)
		}

		if err == nil {
			book = st.(*models.Book)
		}
		// ---

		book.URL = bookURL

		mifID, err := strconv.Atoi(record[0])
		if err != nil {
			log.Fatal(err)
		}
		book.MIFID = pointer.ToInt32(int32(mifID))

		if len(record[1]) > 0 {
			catID, err := strconv.Atoi(record[1])
			if err != nil {
				log.Fatal(err)
			}
			book.CategoryID = pointer.ToInt32(int32(catID))
		}

		if len(record[2]) > 0 {
			book.Title = pointer.ToString(record[2])
		}

		if len(record[3]) > 0 {
			book.Authors = pointer.ToString(record[3])
		}

		if len(record[4]) > 0 {
			book.ISBN = pointer.ToString(record[4])
		}

		DB.Save(book)
		total++
	}

	log.Infof("Found and saved %d books.", total)
}
