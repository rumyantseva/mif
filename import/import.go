package main

import (
	"fmt"
	"io/ioutil"
	"encoding/xml"
	"github.com/rumyantseva/go-yandex-market"
	"net/http"
)

func main() {
	// http://www.mann-ivanov-ferber.ru/book/export/yml/yandex/catalog.xml
	/*xmlFile, err := os.Open("./mif-catalog.xml")
	if err != nil {
		fmt.Println("Error opening file:", err)
		return
	}
	defer xmlFile.Close()*/

	path := "http://www.mann-ivanov-ferber.ru/book/export/yml/yandex/catalog.xml"
	resp, err := http.Get(path)
	if err != nil {
		fmt.Println("Error opening file:", err)
		return
	}

	b, _ := ioutil.ReadAll(resp.Body)

	var catalog yamarket.Catalog
	xml.Unmarshal(b, &catalog)

	//fmt.Println(catalog.Date)
	//fmt.Println("Магазин: "+ catalog.Shop.Name)
	//fmt.Printf("%+v\n", catalog)
	fmt.Println("ID,CategoryID,Title,Authors,ISBN,URL")
	for _, offer := range catalog.Shop.Offers {
		fmt.Printf(
			"`%s`,`%s`,`%s`,`%s`,`%s`,`%s`\n",
			offer.ID, offer.CategoryID, offer.Name, offer.Authot, offer.ISBN, offer.URL,
		)
	}
}
