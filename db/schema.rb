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

ActiveRecord::Schema.define(version: 20141124071205) do

  create_table "meetings", force: true do |t|
    t.date     "meet_on"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", force: true do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presentations", ["meeting_id"], name: "index_presentations_on_meeting_id", using: :btree
  add_index "presentations", ["user_id"], name: "index_presentations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password", limit: 50
    t.string   "name"
    t.text     "profile"
    t.boolean  "is_admin",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",               limit: 40
  end

end
