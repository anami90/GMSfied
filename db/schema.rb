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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130507214118) do

  create_table "budgets", :force => true do |t|
    t.string   "task"
    t.float    "amount"
    t.text     "description"
    t.string   "status"
    t.float    "receiptno"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "donors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "funding"
    t.integer  "project_id"
    t.float    "balance"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "grantees", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "organization"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "date"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "memorandumou_file_name"
    t.string   "memorandumou_content_type"
    t.integer  "memorandumou_file_size"
    t.datetime "memorandumou_updated_at"
  end

  create_table "progresses", :force => true do |t|
    t.integer  "project_id"
    t.string   "milestone"
    t.string   "post"
    t.string   "status"
    t.datetime "date"
    t.integer  "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "balance"
    t.float    "amount"
    t.float    "accountnumber"
    t.integer  "donor_id"
    t.integer  "ledger_id"
    t.integer  "budget_id"
    t.integer  "grantee_id"
    t.date     "startdate"
    t.date     "finish"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image"
    t.integer  "milestones"
    t.string   "stage"
  end

  create_table "sessions", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
  end

  create_table "staffs", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "project_id"
    t.text     "description"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "grantee_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
