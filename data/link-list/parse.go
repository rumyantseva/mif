package main

import (
	"bufio"
	"encoding/json"
	"encoding/xml"
	"fmt"
	"github.com/rumyantseva/mif/models"
	"net/http"
	"os"
	"strconv"
	"strings"
)

// How to run: go run parse.go
func main() {
	linksFile, err := os.OpenFile("./links.txt", os.O_RDWR|os.O_CREATE, 0666)
	defer linksFile.Close()
	if err != nil {
		fmt.Println("Error opening categories file:", err)
		return
	}

	volumes := models.GetVolumes()

	fmt.Println("Found volumes: ")
	fmt.Println(volumes)

	writer := bufio.NewWriter(linksFile)
	for _, volume := range volumes {
		for i := 0; i < 1000; i++ {
			path := "http://www.mann-ivanov-ferber.ru/book/all.ajax?booktype=" + volume + "&page=" + strconv.Itoa(i)
			resp, err := http.Get(path)
			if err != nil {
				fmt.Println("Error opening file:", err)
				return
			}

			body := struct {
				Status  string `json:"status"`
				Message string `json:"message"`
				HTML    string `json:"html"`
			}{}
			json.NewDecoder(resp.Body).Decode(&body)

			if body.Status != "ok" {
				break
			}

			s := "<body><books>" + body.HTML + "</books></body>"
			body.HTML = strings.Join(strings.Fields(s), " ")
			body.HTML = strings.Replace(body.HTML, "&nbsp;", "", -1)

			type Book struct {
				Val string `xml:"href,attr"`
			}

			type Data struct {
				Books []Book `xml:"books>div>a"`
			}

			container := Data{}
			xml.Unmarshal([]byte(body.HTML), &container)

			for _, item := range container.Books {
				writer.WriteString(volume + "," + item.Val + "\n")
			}
		}
	}
	writer.Flush()
}
