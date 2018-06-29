package main

import (
	"bytes"
	"encoding/json"
	"net/http"
	"regexp"
	"strconv"
	"strings"

	"github.com/AlekSi/pointer"
	"github.com/Sirupsen/logrus"
	"gopkg.in/reform.v1"

	"github.com/rumyantseva/mif/models"
	"github.com/rumyantseva/mif/utils"
)

// How to run:
// env DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks go run books.go
func main() {
	log := logrus.New()

	db, err := utils.StartupDB()
	if err != nil {
		log.Fatal(err)
	}

	total := 0

	for {
		st, err := db.FindOneFrom(models.BookTable, "title", nil)

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

		// Parse ISBN
		isbn := parseISBN(respStr, log)
		book.ISBN = pointer.ToString(strings.Trim(isbn, " "))
		if len(*book.ISBN) > 64 {
			book.ISBN = pointer.ToString("")
			log.Errorf("ISBN is wrong: '%s'", *book.ISBN)
		}

		// Parse common information
		parts := strings.Split(respStr, "var initialObject = ")
		if len(parts) != 2 {
			log.Errorf("Couldn't find initial object to parse data for URL %s", book.URL)
			brokenBook := &models.BookBroken{
				URL: book.URL,
			}
			err := db.Save(brokenBook)
			if err != nil {
				logrus.Fatal(err)
			}
			err = db.Delete(book)
			if err != nil {
				logrus.Fatal(err)
			}
			continue
		}

		parts = strings.Split(parts[1], "$.extend(")
		if len(parts) != 2 {
			log.Errorf("Couldn't find extend to parse data for URL %s", book.URL)
			brokenBook := &models.BookBroken{
				URL: book.URL,
			}
			err := db.Save(brokenBook)
			if err != nil {
				logrus.Fatal(err)
			}
			err = db.Delete(book)
			if err != nil {
				logrus.Fatal(err)
			}
			continue
		}
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

		db.Save(book)
		total++
	}

	log.Infof("Found and saved %d books.", total)
}

func parseISBN(response string, log *logrus.Logger) string {
	parts := strings.Split(response, "<section class=\"l-imprint b-imprint\">")
	if len(parts) != 2 {
		return ""
	}

	parts = strings.Split(parts[1], "</section>")
	if len(parts) < 2 {
		return ""
	}

	parts = strings.Split(parts[0], "ISBN")
	if len(parts) != 2 {
		return ""
	}

	parts = strings.Split(parts[1], "</p>")
	if len(parts) < 2 {
		return ""
	}

	isbn := parts[0]

	if len(isbn) > 20 {
		var re = regexp.MustCompile(`\d{3}-\d{1}-\d{5}-\d{3}-\d{1}`)
		isbns := re.FindAllString(isbn, -1)
		if len(isbns) > 0 {
			isbn = isbns[0]
		}
	}

	return isbn
}
