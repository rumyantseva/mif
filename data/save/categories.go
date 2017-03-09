package main

import (
	"bufio"
	"encoding/csv"
	"io"
	"os"
	"strconv"

	"github.com/Sirupsen/logrus"
	"github.com/rumyantseva/mif/models"
	"github.com/rumyantseva/mif/utils"
)

// How to run:
// env DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks go run categories.go
func main() {
	log := logrus.New()

	DB, err := utils.StartupDB()
	if err != nil {
		log.Fatal(err)
	}

	f, err := os.Open("../import/categories.csv")
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

		categoryID, err := strconv.Atoi(record[0])
		if err != nil {
			log.Fatal(err)
		}

		category := &models.Category{
			ID:    int32(categoryID),
			Title: record[1],
		}

		DB.Save(category)
		total++
	}

	log.Infof("Found and saved %d categories.", total)
}
