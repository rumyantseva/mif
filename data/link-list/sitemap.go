package main

import (
	"bufio"
	"encoding/xml"
	"io/ioutil"
	"net/http"
	"os"
	"strings"

	"github.com/Sirupsen/logrus"
)

// How to run: go run sitemap.go
func main() {
	log := logrus.New()

	path := "http://www.mann-ivanov-ferber.ru/sitemap/books.xml"
	resp, err := http.Get(path)
	if err != nil {
		log.Fatalf("Error getting yandex market catalog: %s", err)
	}
	reader := resp.Body

	linksFile, err := os.OpenFile("./links_sitemap.txt", os.O_RDWR|os.O_CREATE, 0666)
	defer linksFile.Close()
	if err != nil {
		log.Fatalf("Error opening file: %s", err)
	}

	type Book struct {
		Val string `xml:"loc"`
	}

	type Data struct {
		XMLName xml.Name `xml:"urlset"`
		Books   []Book   `xml:"url"`
	}

	container := Data{}

	b, _ := ioutil.ReadAll(reader)
	xml.Unmarshal(b, &container)

	writer := bufio.NewWriter(linksFile)
	total := 0
	for _, item := range container.Books {
		writer.WriteString("unknown," + strings.Join(strings.Fields(item.Val), " ") + "\n")
		total++
	}
	writer.Flush()

	log.Infof("Found and saved %d URLs.", total)
}
