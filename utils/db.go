package utils

import (
	"database/sql"
	"log"

	"fmt"
	_ "github.com/lib/pq"
	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/dialects/postgresql"
	"os"
)

// StartupDB get DB parameters from env and returns pointer to reform.DB connection.
// Command line example: ENV db_host=localhost db_port=5432 db_user=postgres db_pass=mysecretpassword db=mifbooks
func StartupDB() (*reform.DB, error) {
	host := os.Getenv("db_host")
	port := os.Getenv("db_port")
	user := os.Getenv("db_user")
	pass := os.Getenv("db_pass")
	dbname := os.Getenv("db")

	source := fmt.Sprintf(
		"postgres://%s:%s@%s:%s/%s?sslmode=disable",
		user, pass, host, port, dbname,
	)

	conn, err := sql.Open("postgres", source)
	if err != nil {
		return nil, err
	}

	// Try ping to check connection
	err = conn.Ping()
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
