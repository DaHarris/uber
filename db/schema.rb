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

ActiveRecord::Schema.define(version: 20150601195750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_truck_apis", force: :cascade do |t|
  end

  create_table "food_trucks", force: :cascade do |t|
    t.string  "name"
    t.string  "location_description"
    t.string  "schedule"
    t.string  "location"
    t.string  "food"
    t.integer "location_id"
    t.string  "json"
    t.float   "longitude"
    t.float   "latitude"
  end

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "password_digest"
    t.string  "api_key"
    t.integer "api_requests",    default: 0
  end

end
