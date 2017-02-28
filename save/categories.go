package main

import (
	"bufio"
	"database/sql"
	"encoding/csv"
	"io"
	"os"
	"strconv"

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
