# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160115001345) do

  create_table "categories", primary_key: "CategoryID", force: :cascade do |t|
    t.string "CategoryName", limit: 15,         null: false
    t.string "Description",  limit: 250
    t.binary "Picture",      limit: 4294967295
  end

  add_index "categories", ["CategoryName"], name: "CategoryName", using: :btree

  create_table "customercustomerdemo", id: false, force: :cascade do |t|
    t.string "CustomerID",     limit: 5,  null: false
    t.string "CustomerTypeID", limit: 10, null: false
  end

  add_index "customercustomerdemo", ["CustomerTypeID"], name: "FK_CustomerCustomerDemo", using: :btree

  create_table "customerdemographics", primary_key: "CustomerTypeID", force: :cascade do |t|
    t.string "CustomerDesc", limit: 250
  end

  create_table "customers", primary_key: "CustomerID", force: :cascade do |t|
    t.string "CompanyName",  limit: 40, null: false
    t.string "ContactName",  limit: 30
    t.string "ContactTitle", limit: 30
    t.string "Address",      limit: 60
    t.string "City",         limit: 15
    t.string "Region",       limit: 15
    t.string "PostalCode",   limit: 10
    t.string "Country",      limit: 15
    t.string "Phone",        limit: 24
    t.string "Fax",          limit: 24
  end

  add_index "customers", ["City"], name: "City", using: :btree
  add_index "customers", ["CompanyName"], name: "CompanyName", using: :btree
  add_index "customers", ["PostalCode"], name: "PostalCode", using: :btree
  add_index "customers", ["Region"], name: "Region", using: :btree

  create_table "employees", primary_key: "EmployeeID", force: :cascade do |t|
    t.string   "LastName",        limit: 20,         null: false
    t.string   "FirstName",       limit: 10,         null: false
    t.string   "Title",           limit: 30
    t.string   "TitleOfCourtesy", limit: 25
    t.datetime "BirthDate"
    t.datetime "HireDate"
    t.string   "Address",         limit: 60
    t.string   "City",            limit: 15
    t.string   "Region",          limit: 15
    t.string   "PostalCode",      limit: 10
    t.string   "Country",         limit: 15
    t.string   "HomePhone",       limit: 24
    t.string   "Extension",       limit: 4
    t.binary   "Photo",           limit: 4294967295
    t.string   "Notes",           limit: 250
    t.integer  "ReportsTo",       limit: 4
    t.string   "PhotoPath",       limit: 255
  end

  add_index "employees", ["LastName"], name: "LastName", using: :btree
  add_index "employees", ["PostalCode"], name: "PostalCode", using: :btree

  create_table "employeeterritories", id: false, force: :cascade do |t|
    t.integer "EmployeeID",  limit: 4,  null: false
    t.string  "TerritoryID", limit: 20, null: false
  end

  add_index "employeeterritories", ["TerritoryID"], name: "FK_EmployeeTerritories_Territories", using: :btree

  create_table "order_details", id: false, force: :cascade do |t|
    t.integer "OrderID",   limit: 4,                null: false
    t.integer "ProductID", limit: 4,                null: false
    t.float   "UnitPrice", limit: 24, default: 0.0, null: false
    t.integer "Quantity",  limit: 2,  default: 1,   null: false
    t.float   "Discount",  limit: 53, default: 0.0, null: false
  end

  add_index "order_details", ["OrderID"], name: "OrderID", using: :btree
  add_index "order_details", ["OrderID"], name: "OrdersOrder_Details", using: :btree
  add_index "order_details", ["ProductID"], name: "ProductID", using: :btree
  add_index "order_details", ["ProductID"], name: "ProductsOrder_Details", using: :btree

  create_table "orders", primary_key: "OrderID", force: :cascade do |t|
    t.string  "CustomerID",     limit: 5
    t.integer "EmployeeID",     limit: 4
    t.string  "OrderDate",      limit: 50
    t.string  "RequiredDate",   limit: 50
    t.string  "ShippedDate",    limit: 50
    t.integer "ShipVia",        limit: 4
    t.float   "Freight",        limit: 53, default: 0.0
    t.string  "ShipName",       limit: 40
    t.string  "ShipAddress",    limit: 60
    t.string  "ShipCity",       limit: 15
    t.string  "ShipRegion",     limit: 15
    t.string  "ShipPostalCode", limit: 10
    t.string  "ShipCountry",    limit: 15
  end

  add_index "orders", ["CustomerID"], name: "CustomerID", using: :btree
  add_index "orders", ["CustomerID"], name: "CustomersOrders", using: :btree
  add_index "orders", ["EmployeeID"], name: "EmployeeID", using: :btree
  add_index "orders", ["EmployeeID"], name: "EmployeesOrders", using: :btree
  add_index "orders", ["OrderDate"], name: "OrderDate", using: :btree
  add_index "orders", ["ShipPostalCode"], name: "ShipPostalCode", using: :btree
  add_index "orders", ["ShipVia"], name: "ShippersOrders", using: :btree
  add_index "orders", ["ShippedDate"], name: "ShippedDate", using: :btree

  create_table "products", primary_key: "ProductID", force: :cascade do |t|
    t.string  "ProductName",     limit: 40,                  null: false
    t.integer "SupplierID",      limit: 4
    t.integer "CategoryID",      limit: 4
    t.string  "QuantityPerUnit", limit: 20
    t.float   "UnitPrice",       limit: 24, default: 0.0
    t.integer "UnitsInStock",    limit: 2,  default: 0
    t.integer "UnitsOnOrder",    limit: 2,  default: 0
    t.integer "ReorderLevel",    limit: 2,  default: 0
    t.binary  "Discontinued",    limit: 1,  default: "b'0'", null: false
  end

  add_index "products", ["CategoryID"], name: "CategoriesProducts", using: :btree
  add_index "products", ["CategoryID"], name: "CategoryID", using: :btree
  add_index "products", ["ProductName"], name: "ProductName", using: :btree
  add_index "products", ["SupplierID"], name: "SupplierID", using: :btree
  add_index "products", ["SupplierID"], name: "SuppliersProducts", using: :btree

  create_table "region", primary_key: "RegionID", force: :cascade do |t|
    t.string "RegionDescription", limit: 50, null: false
  end

  create_table "shippers", primary_key: "ShipperID", force: :cascade do |t|
    t.string "CompanyName", limit: 40, null: false
    t.string "Phone",       limit: 24
  end

  create_table "suppliers", primary_key: "SupplierID", force: :cascade do |t|
    t.string "CompanyName",  limit: 40,  null: false
    t.string "ContactName",  limit: 30
    t.string "ContactTitle", limit: 30
    t.string "Address",      limit: 60
    t.string "City",         limit: 15
    t.string "Region",       limit: 15
    t.string "PostalCode",   limit: 10
    t.string "Country",      limit: 15
    t.string "Phone",        limit: 24
    t.string "Fax",          limit: 24
    t.string "HomePage",     limit: 250
  end

  add_index "suppliers", ["CompanyName"], name: "CompanyName", using: :btree
  add_index "suppliers", ["PostalCode"], name: "PostalCode", using: :btree

  create_table "territories", primary_key: "TerritoryID", force: :cascade do |t|
    t.string  "TerritoryDescription", limit: 50, null: false
    t.integer "RegionID",             limit: 4,  null: false
  end

  add_index "territories", ["RegionID"], name: "FK_Territories_Region", using: :btree

  add_foreign_key "customercustomerdemo", "customerdemographics", column: "CustomerTypeID", primary_key: "CustomerTypeID", name: "FK_CustomerCustomerDemo"
  add_foreign_key "customercustomerdemo", "customers", column: "CustomerID", primary_key: "CustomerID", name: "FK_CustomerCustomerDemo_Customers"
  add_foreign_key "employeeterritories", "employees", column: "EmployeeID", primary_key: "EmployeeID", name: "FK_EmployeeTerritories_Employees"
  add_foreign_key "employeeterritories", "territories", column: "TerritoryID", primary_key: "TerritoryID", name: "FK_EmployeeTerritories_Territories"
  add_foreign_key "order_details", "orders", column: "OrderID", primary_key: "OrderID", name: "order_details_ibfk_2"
  add_foreign_key "order_details", "products", column: "ProductID", primary_key: "ProductID", name: "order_details_ibfk_1"
  add_foreign_key "territories", "region", column: "RegionID", primary_key: "RegionID", name: "FK_Territories_Region"
end
