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
// env db_host=localhost db_port=5432 db_user=postgres db_pass=mysecretpassword db=mifbooks go run books.go
func main() {
	log := logrus.New()

	DB, err := utils.StartupDB()
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

	// Read rows from file
	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		book := &models.Book{}

		// Check if book with URL exists
		bookURL := record[5]
		bookURL = strings.Replace(bookURL, "?buytab=paperbook&utm_source=ya.market&utm_medium=cpc&utm_campaign=market", "", 100)

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
