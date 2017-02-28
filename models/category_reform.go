package models

// generated with gopkg.in/reform.v1

import (
	"fmt"
	"strings"

	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/parse"
)

type categoryTableType struct {
	s parse.StructInfo
	z []interface{}
}

// Schema returns a schema name in SQL database ("").
func (v *categoryTableType) Schema() string {
	return v.s.SQLSchema
}

// Name returns a view or table name in SQL database ("categories").
func (v *categoryTableType) Name() string {
	return v.s.SQLName
}

// Columns returns a new slice of column names for that view or table in SQL database.
func (v *categoryTableType) Columns() []string {
	return []string{"id", "title", "created_at", "updated_at"}
}

// NewStruct makes a new struct for that view or table.
func (v *categoryTableType) NewStruct() reform.Struct {
	return new(Category)
}

// NewRecord makes a new record for that table.
func (v *categoryTableType) NewRecord() reform.Record {
	return new(Category)
}

// PKColumnIndex returns an index of primary key column for that table in SQL database.
func (v *categoryTableType) PKColumnIndex() uint {
	return uint(v.s.PKFieldIndex)
}

// CategoryTable represents categories view or table in SQL database.
var CategoryTable = &categoryTableType{
	s: parse.StructInfo{Type: "Category", SQLSchema: "", SQLName: "categories", Fields: []parse.FieldInfo{{Name: "ID", PKType: "int32", Column: "id"}, {Name: "Title", PKType: "", Column: "title"}, {Name: "CreatedAt", PKType: "", Column: "created_at"}, {Name: "UpdatedAt", PKType: "", Column: "updated_at"}}, PKFieldIndex: 0},
	z: new(Category).Values(),
}

// String returns a string representation of this struct or record.
func (s Category) String() string {
	res := make([]string, 4)
	res[0] = "ID: " + reform.Inspect(s.ID, true)
	res[1] = "Title: " + reform.Inspect(s.Title, true)
	res[2] = "CreatedAt: " + reform.Inspect(s.CreatedAt, true)
	res[3] = "UpdatedAt: " + reform.Inspect(s.UpdatedAt, true)
	return strings.Join(res, ", ")
}

// Values returns a slice of struct or record field values.
// Returned interface{} values are never untyped nils.
func (s *Category) Values() []interface{} {
	return []interface{}{
		s.ID,
		s.Title,
		s.CreatedAt,
		s.UpdatedAt,
	}
}

// Pointers returns a slice of pointers to struct or record fields.
// Returned interface{} values are never untyped nils.
func (s *Category) Pointers() []interface{} {
	return []interface{}{
		&s.ID,
		&s.Title,
		&s.CreatedAt,
		&s.UpdatedAt,
	}
}

// View returns View object for that struct.
func (s *Category) View() reform.View {
	return CategoryTable
}

// Table returns Table object for that record.
func (s *Category) Table() reform.Table {
	return CategoryTable
}

// PKValue returns a value of primary key for that record.
// Returned interface{} value is never untyped nil.
func (s *Category) PKValue() interface{} {
	return s.ID
}

// PKPointer returns a pointer to primary key field for that record.
// Returned interface{} value is never untyped nil.
func (s *Category) PKPointer() interface{} {
	return &s.ID
}

// HasPK returns true if record has non-zero primary key set, false otherwise.
func (s *Category) HasPK() bool {
	return s.ID != CategoryTable.z[CategoryTable.s.PKFieldIndex]
}

// SetPK sets record primary key.
func (s *Category) SetPK(pk interface{}) {
	if i64, ok := pk.(int64); ok {
		s.ID = int32(i64)
	} else {
		s.ID = pk.(int32)
	}
}

// check interfaces
var (
	_ reform.View   = CategoryTable
	_ reform.Struct = new(Category)
	_ reform.Table  = CategoryTable
	_ reform.Record = new(Category)
	_ fmt.Stringer  = new(Category)
)

func init() {
	parse.AssertUpToDate(&CategoryTable.s, new(Category))
}
