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

ActiveRecord::Schema.define(version: 20151023015241) do

  create_table "businesses", force: :cascade do |t|
    t.integer  "business_id",  limit: 4
    t.string   "name",         limit: 255
    t.string   "address",      limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.integer  "postal_code",  limit: 4
    t.float    "latitude",     limit: 24
    t.float    "longitude",    limit: 24
    t.string   "phone_number", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "description",  limit: 65535
    t.integer  "score",        limit: 4
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lou_inspections", force: :cascade do |t|
    t.integer  "business_id", limit: 4
    t.integer  "score",       limit: 4
    t.date     "date"
    t.string   "visit",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "lou_inspections", ["business_id"], name: "index_lou_inspections_on_business_id", using: :btree

  create_table "lou_violations", force: :cascade do |t|
    t.integer  "business_id", limit: 4
    t.date     "date"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,        null: false
    t.integer  "item_id",    limit: 4,          null: false
    t.string   "event",      limit: 255,        null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
