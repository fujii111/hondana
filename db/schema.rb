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

ActiveRecord::Schema.define(version: 20141212001655) do

  create_table "bookgenres", force: true do |t|
    t.string   "name",       null: false
    t.integer  "sort",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookinfo_genres", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookinfos", force: true do |t|
    t.string   "name",         null: false
    t.string   "publisher",    null: false
    t.string   "author",       null: false
    t.string   "langage",      null: false
    t.date     "release_date", null: false
    t.float    "height",       null: false
    t.float    "width",        null: false
    t.float    "thinck",       null: false
    t.string   "isbn10"
    t.string   "isbn13"
    t.string   "content"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.integer  "members_id",   null: false
    t.integer  "bookinfos_id", null: false
    t.float    "height",       null: false
    t.float    "width",        null: false
    t.float    "thick",        null: false
    t.float    "weight",       null: false
    t.integer  "state",        null: false
    t.boolean  "sunburn",      null: false
    t.boolean  "scar",         null: false
    t.integer  "graffiti",     null: false
    t.integer  "broken",       null: false
    t.boolean  "obi",          null: false
    t.boolean  "smoke",        null: false
    t.boolean  "pet",          null: false
    t.boolean  "mold",         null: false
    t.string   "remarks"
    t.integer  "books_flag",   null: false
    t.date     "entry_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carriers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_authors", force: true do |t|
    t.integer  "members_id", null: false
    t.string   "author",     null: false
    t.integer  "sort",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "login_id",     null: false
    t.string   "name",         null: false
    t.string   "kana",         null: false
    t.date     "birthday",     null: false
    t.string   "password",     null: false
    t.string   "nickname",     null: false
    t.string   "mail_address", null: false
    t.string   "address",      null: false
    t.integer  "point"
    t.boolean  "quit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members_books", force: true do |t|
    t.integer  "members_id", null: false
    t.integer  "books_id",   null: false
    t.date     "entry_date", null: false
    t.integer  "sort",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members_genres", force: true do |t|
    t.integer  "members_id",    null: false
    t.integer  "bookgenres_id", null: false
    t.integer  "sort",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", force: true do |t|
    t.date     "notices_date", null: false
    t.integer  "members_id",   null: false
    t.string   "title",        null: false
    t.string   "content",      null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "torades", force: true do |t|
    t.date     "request_date"
    t.date     "receipt_date"
    t.date     "send_date"
    t.date     "complete_date"
    t.integer  "receipt_members",  null: false
    t.integer  "delivery_members", null: false
    t.integer  "books_id",         null: false
    t.integer  "carriers_id",      null: false
    t.integer  "tracking_number",  null: false
    t.integer  "trades_flag",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
