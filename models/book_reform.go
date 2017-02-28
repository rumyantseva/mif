package models

// generated with gopkg.in/reform.v1

import (
	"fmt"
	"strings"

	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/parse"
)

type bookTableType struct {
	s parse.StructInfo
	z []interface{}
}

// Schema returns a schema name in SQL database ("").
func (v *bookTableType) Schema() string {
	return v.s.SQLSchema
}

// Name returns a view or table name in SQL database ("books").
func (v *bookTableType) Name() string {
	return v.s.SQLName
}

// Columns returns a new slice of column names for that view or table in SQL database.
func (v *bookTableType) Columns() []string {
	return []string{"id", "mif_id", "category_id", "title", "isbn", "authors", "url", "created_at", "updated_at"}
}

// NewStruct makes a new struct for that view or table.
func (v *bookTableType) NewStruct() reform.Struct {
	return new(Book)
}

// NewRecord makes a new record for that table.
func (v *bookTableType) NewRecord() reform.Record {
	return new(Book)
}

// PKColumnIndex returns an index of primary key column for that table in SQL database.
func (v *bookTableType) PKColumnIndex() uint {
	return uint(v.s.PKFieldIndex)
}

// BookTable represents books view or table in SQL database.
var BookTable = &bookTableType{
	s: parse.StructInfo{Type: "Book", SQLSchema: "", SQLName: "books", Fields: []parse.FieldInfo{{Name: "ID", PKType: "int32", Column: "id"}, {Name: "MIFID", PKType: "", Column: "mif_id"}, {Name: "CategoryID", PKType: "", Column: "category_id"}, {Name: "Title", PKType: "", Column: "title"}, {Name: "ISBN", PKType: "", Column: "isbn"}, {Name: "Authors", PKType: "", Column: "authors"}, {Name: "URL", PKType: "", Column: "url"}, {Name: "CreatedAt", PKType: "", Column: "created_at"}, {Name: "UpdatedAt", PKType: "", Column: "updated_at"}}, PKFieldIndex: 0},
	z: new(Book).Values(),
}

// String returns a string representation of this struct or record.
func (s Book) String() string {
	res := make([]string, 9)
	res[0] = "ID: " + reform.Inspect(s.ID, true)
	res[1] = "MIFID: " + reform.Inspect(s.MIFID, true)
	res[2] = "CategoryID: " + reform.Inspect(s.CategoryID, true)
	res[3] = "Title: " + reform.Inspect(s.Title, true)
	res[4] = "ISBN: " + reform.Inspect(s.ISBN, true)
	res[5] = "Authors: " + reform.Inspect(s.Authors, true)
	res[6] = "URL: " + reform.Inspect(s.URL, true)
	res[7] = "CreatedAt: " + reform.Inspect(s.CreatedAt, true)
	res[8] = "UpdatedAt: " + reform.Inspect(s.UpdatedAt, true)
	return strings.Join(res, ", ")
}

// Values returns a slice of struct or record field values.
// Returned interface{} values are never untyped nils.
func (s *Book) Values() []interface{} {
	return []interface{}{
		s.ID,
		s.MIFID,
		s.CategoryID,
		s.Title,
		s.ISBN,
		s.Authors,
		s.URL,
		s.CreatedAt,
		s.UpdatedAt,
	}
}

// Pointers returns a slice of pointers to struct or record fields.
// Returned interface{} values are never untyped nils.
func (s *Book) Pointers() []interface{} {
	return []interface{}{
		&s.ID,
		&s.MIFID,
		&s.CategoryID,
		&s.Title,
		&s.ISBN,
		&s.Authors,
		&s.URL,
		&s.CreatedAt,
		&s.UpdatedAt,
	}
}

// View returns View object for that struct.
func (s *Book) View() reform.View {
	return BookTable
}

// Table returns Table object for that record.
func (s *Book) Table() reform.Table {
	return BookTable
}

// PKValue returns a value of primary key for that record.
// Returned interface{} value is never untyped nil.
func (s *Book) PKValue() interface{} {
	return s.ID
}

// PKPointer returns a pointer to primary key field for that record.
// Returned interface{} value is never untyped nil.
func (s *Book) PKPointer() interface{} {
	return &s.ID
}

// HasPK returns true if record has non-zero primary key set, false otherwise.
func (s *Book) HasPK() bool {
	return s.ID != BookTable.z[BookTable.s.PKFieldIndex]
}

// SetPK sets record primary key.
func (s *Book) SetPK(pk interface{}) {
	if i64, ok := pk.(int64); ok {
		s.ID = int32(i64)
	} else {
		s.ID = pk.(int32)
	}
}

// check interfaces
var (
	_ reform.View   = BookTable
	_ reform.Struct = new(Book)
	_ reform.Table  = BookTable
	_ reform.Record = new(Book)
	_ fmt.Stringer  = new(Book)
)

func init() {
	parse.AssertUpToDate(&BookTable.s, new(Book))
}
