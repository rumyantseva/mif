package utils

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	// We don't need to use lib/pq directly
	_ "github.com/lib/pq"
	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/dialects/postgresql"
	"time"
)

// StartupDB get DB parameters from env and returns pointer to reform.DB connection.
// Command line example: env DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks
func StartupDB() (*reform.DB, error) {
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	user := os.Getenv("DB_USER")
	pass := os.Getenv("DB_PASS")
	dbname := os.Getenv("DB")

	source := fmt.Sprintf(
		"postgres://%s:%s@%s:%s/%s?sslmode=disable",
		user, pass, host, port, dbname,
	)

	conn, err := sql.Open("postgres", source)
	if err != nil {
		return nil, err
	}

	// Try ping to check connection
	attemps := 10
	for i := 0; i < attemps; i++ {
		err = conn.Ping()
		if err == nil {
			break
		}
		time.Sleep(5 * time.Second)
	}
	if err != nil {
		return nil, err
	}

	db := reform.NewDB(
		conn,
		postgresql.Dialect,
		reform.NewPrintfLogger(log.Printf),
	)
	return db, nil
}
