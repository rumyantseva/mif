package main

import (
	"flag"
	"net/http"
	"os"

	"github.com/Sirupsen/logrus"
	"github.com/julienschmidt/httprouter"
	"github.com/rumyantseva/mif/middleware"
	"github.com/rumyantseva/mif/utils"
)

var (
	// Debug flag turn on debug mode
	Debug = flag.Bool("debug", false, "Enable debug mode")
)

// How to run:
// ENV host=127.0.0.1 port=80 db_host=localhost db_port=5432 db_user=postgres db_pass=mysecretpassword db=mifbooks go run main.go
func main() {
	flag.Parse()
	log := logrus.New()

	if *Debug {
		log.Level = logrus.DebugLevel
		log.Debug("Debug mode is on.")
	} else {
		log.Level = logrus.InfoLevel
	}

	host := os.Getenv("host")
	port := os.Getenv("port")
	addr := host + ":" + port

	log.Info("Start service on " + addr + "...")

	db, err := utils.StartupDB()
	if err != nil {
		log.Fatal(err)
	}

	router := httprouter.New()
	mw := middleware.New(db, log)

	router.GET("/api/v1/books", mw.SearchBooks)
	router.GET("/api/v1/books/:id", mw.SingleBook)

	router.GET("/api/v1/library", mw.Authorize(mw.Library))
	router.POST("/api/v1/library", mw.Authorize(mw.AddToLibrary))
	router.DELETE("/api/v1/library", mw.Authorize(mw.DeleteFromLibrary))

	err = http.ListenAndServe(addr, router)
	if err != nil {
		log.Fatal(err)
	}
}
