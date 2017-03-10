package main

import (
	"bufio"
	"encoding/csv"
	"io"
	"os"
	"strconv"
	"strings"

	"github.com/AlekSi/pointer"
	"github.com/Sirupsen/logrus"
	"github.com/rumyantseva/mif/models"
	"github.com/rumyantseva/mif/utils"
	"gopkg.in/reform.v1"
)

// How to run:
// env DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks go run books.go
func main() {
	log := logrus.New()

	db, err := utils.StartupDB()
	if err != nil {
		log.Fatal(err)
	}

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

	bookSaver := NewBookSaver(db, log)

	// Read rows from file
	for {
		record, err := r.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			logrus.Fatal(err)
		}

		err = bookSaver.SaveBook(record)
		if err != nil {
			logrus.Fatal(err)
		}
		total++
	}

	log.Infof("Found and saved %d books.", total)
}

// BookSaver service-helper to save a book.
type BookSaver struct {
	db  *reform.DB
	log *logrus.Logger
}

// NewBookSaver returns an instance of BookSaver.
func NewBookSaver(db *reform.DB, log *logrus.Logger) *BookSaver {
	return &BookSaver{
		db:  db,
		log: log,
	}
}

// SaveBook insert new book to database or update an old one.
func (bs *BookSaver) SaveBook(record []string) error {

	book := &models.Book{}

	// Check if book with URL exists
	bookURL := record[5]
	bookURL = strings.Replace(bookURL, "?buytab=paperbook&utm_source=ya.market&utm_medium=cpc&utm_campaign=market", "", 100)

	if len(bookURL) == 0 {
		logrus.Fatalf("Book %s doesn't have URL!", record[0])
	}

	st, err := bs.db.FindOneFrom(models.BookTable, "url", bookURL)

	if err != nil && err != reform.ErrNoRows {
		return err
	}

	if err == nil {
		book = st.(*models.Book)
	}
	// ---

	book.URL = bookURL

	mifID, err := strconv.Atoi(record[0])
	if err != nil {
		bs.log.Fatal(err)
	}
	book.MIFID = pointer.ToInt32(int32(mifID))

	if len(record[1]) > 0 {
		catID, err := strconv.Atoi(record[1])
		if err != nil {
			bs.log.Fatal(err)
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

	return bs.db.Save(book)
}
