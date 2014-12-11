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

ActiveRecord::Schema.define(version: 20141211034059) do

  create_table "bookgenres", force: true do |t|
    t.string   "name",       null: false
    t.integer  "sort",       null: false
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

end
