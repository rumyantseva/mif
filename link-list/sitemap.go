package main

import (
	"encoding/xml"
	"net/http"

	"bufio"
	"os"

	"io/ioutil"
	"strings"

	"github.com/Sirupsen/logrus"
)

func standardizeSpaces(s string) string {
	return strings.Join(strings.Fields(s), " ")
}

func main() {
	log := logrus.New()

	path := "http://www.mann-ivanov-ferber.ru/sitemap/books.xml"
	resp, err := http.Get(path)
	if err != nil {
		log.Fatalf("Error getting yandex market catalog: %s", err)
	}
	reader := resp.Body

	/*f, err := os.Open("./sitemap.xml")
	defer f.Close()
	if err != nil {
		log.Fatalf("Error opening file: %s", err)
	}
	reader := bufio.NewReader(f)*/

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
	//xml.NewDecoder(reader).Decode(&container)

	b, _ := ioutil.ReadAll(reader)
	xml.Unmarshal(b, &container)

	writer := bufio.NewWriter(linksFile)
	total := 0
	for _, item := range container.Books {
		writer.WriteString("unknown," + standardizeSpaces(item.Val) + "\n")
		total++
	}
	writer.Flush()

	log.Infof("Found and saved %d URLs.", total)
}
