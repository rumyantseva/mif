package main

import (
	"fmt"
	"io/ioutil"
	"encoding/xml"
	"github.com/rumyantseva/go-yandex-market"
	"net/http"
	"os"
	"bufio"
)

// How to run: go run import.go
func main() {
	categoriesFile, err := os.OpenFile("./categories.csv", os.O_RDWR, 0666)
	defer categoriesFile.Close()
	if err != nil {
		fmt.Println("Error opening categories file:", err)
		return
	}

	offersFile, err := os.OpenFile("./books.csv", os.O_RDWR, 0666)
	defer offersFile.Close()
	if err != nil {
		fmt.Println("Error opening offers file:", err)
		return
	}

	path := "http://www.mann-ivanov-ferber.ru/book/export/yml/yandex/catalog.xml"
	resp, err := http.Get(path)
	if err != nil {
		fmt.Println("Error getting yandex market catalog:", err)
		return
	}

	b, _ := ioutil.ReadAll(resp.Body)

	var catalog yamarket.Catalog
	xml.Unmarshal(b, &catalog)

	// Categories
	writer := bufio.NewWriter(categoriesFile)
	writer.WriteString("\"ID\",\"Title\"\n")
	for _, category := range catalog.Shop.Categories {
		writer.WriteString(
			fmt.Sprintf("\"%s\",\"%s\"\n", category.ID, category.Title),
		)
	}
	writer.Flush()

	// Offers
	writer = bufio.NewWriter(offersFile)
	writer.WriteString("\"ID\",\"CategoryID\",\"Title\",\"Authors\",\"ISBN\",\"URL\"\n")
	for _, offer := range catalog.Shop.Offers {
		writer.WriteString(fmt.Sprintf(
			"\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n",
			offer.ID, offer.CategoryID, offer.Name, offer.Authot, offer.ISBN, offer.URL,
		))
	}
	writer.Flush()
}
