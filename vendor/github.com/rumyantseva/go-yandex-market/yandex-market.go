package yamarket

import (
	"encoding/xml"
)

// Catalog describes the whole catalog entry.
// https://yandex.ru/support/partnermarket/yml/about-yml.xml
type Catalog struct {
	XMLName xml.Name `xml:"yml_catalog"`
	Date    string   `xml:"date,attr"`
	Shop    Shop     `xml:"shop"`
}

// Shop describes common shop entity.
// https://yandex.ru/support/partnermarket/yml/about-yml.xml
type Shop struct {
	Name            string           `xml:"name"`
	Company         string           `xml:"company"`
	URL             string           `xml:"url"`
	Platform        *string          `xml:"platform"`
	Agency          *string          `xml:"agency"`
	Email           *string          `xml:"email"`
	Currencies      []Currency       `xml:"currencies>currency"`
	Categories      []Category       `xml:"categories>category"`
	DeliveryOptions []DeliveryOption `xml:"delivery-options"`
	CPA             bool             `xml:"cpa"`
	Offers          []BookData       `xml:"offers>offer"`
}

// Currency describes list of supported currencies
// https://yandex.ru/support/partnermarket/currencies.xml
type Currency struct {
	//XMLName   xml.Name `xml:"currency"`
	ID   string  `xml:"id,attr"`
	Rate string  `xml:"rate,attr"`
	Plus *string `xml:"plus,attr"`
}

// Category describes shop category
// https://yandex.ru/support/partnermarket/categories.xml
type Category struct {
	XMLName  xml.Name `xml:"category"`
	ID       string   `xml:"id,attr"`
	Title    string   `xml:",innerxml"`
	ParentID *string  `xml:"parentId,attr"`
}

// DeliveryOption describes time of delivery.
// https://yandex.ru/support/partnermarket/elements/delivery-options.xml
type DeliveryOption struct {
	Cost        int32
	Days        string
	OrderBefore *uint8
}

// Offer describes simple typical offer.
// https://yandex.ru/support/partnermarket/offers.xml
type Offer struct {
	ID              string
	URL             string
	Type            *string
	Bid             *uint16
	CBid            *uint16
	Fee             *uint16
	Price           *Price
	OldPrice        *Price
	CurrencyID      string
	CategoryID      string
	Category        string
	Picture         string
	DeliveryOptions []DeliveryOption
	Delivery        bool
	Pickup          bool
	Store           bool
	Available       bool
}

// Price represents price data
type Price struct {
	Value uint32
	From  bool
}

// BookData respresents typical data of a book
// https://yandex.ru/support/partnermarket/export/books.xml
type BookData struct {
	Name        string `xml:"name"`
	Authot      string `xml:"author"`
	ID          string `xml:"id,attr"`
	URL         string `xml:"url"`
	ISBN        string `xml:"isbn"`
	Picture     string `xml:"picture"`
	Publisher   string `xml:"publisher"`
	Description string `xml:"description"`
	CategoryID  string `xml:"categoryId"`
}
