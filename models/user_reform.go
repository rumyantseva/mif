package models

// generated with gopkg.in/reform.v1

import (
	"fmt"
	"strings"

	"gopkg.in/reform.v1"
	"gopkg.in/reform.v1/parse"
)

type userTableType struct {
	s parse.StructInfo
	z []interface{}
}

// Schema returns a schema name in SQL database ("").
func (v *userTableType) Schema() string {
	return v.s.SQLSchema
}

// Name returns a view or table name in SQL database ("users").
func (v *userTableType) Name() string {
	return v.s.SQLName
}

// Columns returns a new slice of column names for that view or table in SQL database.
func (v *userTableType) Columns() []string {
	return []string{"id", "email", "token", "created_at", "updated_at"}
}

// NewStruct makes a new struct for that view or table.
func (v *userTableType) NewStruct() reform.Struct {
	return new(User)
}

// NewRecord makes a new record for that table.
func (v *userTableType) NewRecord() reform.Record {
	return new(User)
}

// PKColumnIndex returns an index of primary key column for that table in SQL database.
func (v *userTableType) PKColumnIndex() uint {
	return uint(v.s.PKFieldIndex)
}

// UserTable represents users view or table in SQL database.
var UserTable = &userTableType{
	s: parse.StructInfo{Type: "User", SQLSchema: "", SQLName: "users", Fields: []parse.FieldInfo{{Name: "ID", PKType: "int32", Column: "id"}, {Name: "Email", PKType: "", Column: "email"}, {Name: "Token", PKType: "", Column: "token"}, {Name: "CreatedAt", PKType: "", Column: "created_at"}, {Name: "UpdatedAt", PKType: "", Column: "updated_at"}}, PKFieldIndex: 0},
	z: new(User).Values(),
}

// String returns a string representation of this struct or record.
func (s User) String() string {
	res := make([]string, 5)
	res[0] = "ID: " + reform.Inspect(s.ID, true)
	res[1] = "Email: " + reform.Inspect(s.Email, true)
	res[2] = "Token: " + reform.Inspect(s.Token, true)
	res[3] = "CreatedAt: " + reform.Inspect(s.CreatedAt, true)
	res[4] = "UpdatedAt: " + reform.Inspect(s.UpdatedAt, true)
	return strings.Join(res, ", ")
}

// Values returns a slice of struct or record field values.
// Returned interface{} values are never untyped nils.
func (s *User) Values() []interface{} {
	return []interface{}{
		s.ID,
		s.Email,
		s.Token,
		s.CreatedAt,
		s.UpdatedAt,
	}
}

// Pointers returns a slice of pointers to struct or record fields.
// Returned interface{} values are never untyped nils.
func (s *User) Pointers() []interface{} {
	return []interface{}{
		&s.ID,
		&s.Email,
		&s.Token,
		&s.CreatedAt,
		&s.UpdatedAt,
	}
}

// View returns View object for that struct.
func (s *User) View() reform.View {
	return UserTable
}

// Table returns Table object for that record.
func (s *User) Table() reform.Table {
	return UserTable
}

// PKValue returns a value of primary key for that record.
// Returned interface{} value is never untyped nil.
func (s *User) PKValue() interface{} {
	return s.ID
}

// PKPointer returns a pointer to primary key field for that record.
// Returned interface{} value is never untyped nil.
func (s *User) PKPointer() interface{} {
	return &s.ID
}

// HasPK returns true if record has non-zero primary key set, false otherwise.
func (s *User) HasPK() bool {
	return s.ID != UserTable.z[UserTable.s.PKFieldIndex]
}

// SetPK sets record primary key.
func (s *User) SetPK(pk interface{}) {
	if i64, ok := pk.(int64); ok {
		s.ID = int32(i64)
	} else {
		s.ID = pk.(int32)
	}
}

// check interfaces
var (
	_ reform.View   = UserTable
	_ reform.Struct = new(User)
	_ reform.Table  = UserTable
	_ reform.Record = new(User)
	_ fmt.Stringer  = new(User)
)

func init() {
	parse.AssertUpToDate(&UserTable.s, new(User))
}
