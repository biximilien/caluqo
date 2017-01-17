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

ActiveRecord::Schema.define(version: 20170117041002) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.bigint   "facebook_id"
    t.index ["facebook_id"], name: "index_events_on_facebook_id", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.integer  "facebook_id", limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["facebook_id"], name: "index_pages_on_facebook_id", unique: true
  end

end
