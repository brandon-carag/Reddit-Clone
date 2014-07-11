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

ActiveRecord::Schema.define(version: 20140710002949) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "comments", force: true do |t|
    t.text    "comment"
    t.integer "user_id", limit: 255
    t.integer "post_id", limit: 255
  end

  create_table "posts", force: true do |t|
    t.string  "url"
    t.string  "title"
    t.text    "description"
    t.integer "user_id",     limit: 255
  end

  create_table "users", force: true do |t|
    t.string "username"
  end

end