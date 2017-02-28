package main

import (
	"database/sql"

	"bytes"
	"fmt"
	"net/http"
	"strings"

	"encoding/json"

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

	total := 0

	for {
		st, err := DB.FindOneFrom(models.BookTable, "title", nil)

		if err != nil && err != reform.ErrNoRows {
			logrus.Fatal(err)
		}

		if err == reform.ErrNoRows {
			break
		}

		book := st.(*models.Book)

		resp, err := http.Get(book.URL)
		if err != nil {
			logrus.Fatal(err)
		}

		buf := new(bytes.Buffer)
		buf.ReadFrom(resp.Body)
		respStr := buf.String()

		parts := strings.Split(respStr, "var initialObject = ")
		if len(parts) != 2 {
			log.Fatalf("Couldn't parse page for URL %s", book.URL)
		}

		parts = strings.Split(parts[1], "$.extend(")
		if len(parts) != 2 {
			log.Fatalf("Couldn't parse page for URL %s", book.URL)
		}

		fmt.Println(parts[0])

		parsed := struct {
			ID         string `json:"productID"`
			Title      string `json:"productName"`
			Authors    string `json:"productAuthor"`
			CategoryID string `json:"productCategoryID"`
		}{}

		err = json.NewDecoder(strings.NewReader(parts[0])).Decode(&parsed)
		if err != nil {
			log.Fatal(err)
		}

		book.Title = pointer.ToString(parsed.Title)
		book.Authors = pointer.ToString(parsed.Authors)

		mifID, err := strconv.Atoi(parsed.ID)
		if err != nil {
			log.Fatal(err)
		}
		book.MIFID = pointer.ToInt32(int32(mifID))

		catID, err := strconv.Atoi(parsed.CategoryID)
		if err != nil {
			log.Fatal(err)
		}
		book.CategoryID = pointer.ToInt32(int32(catID))

		DB.Save(book)
		total++
	}

	log.Infof("Found and saved %d books.", total)
}
