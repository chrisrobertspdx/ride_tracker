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

ActiveRecord::Schema.define(version: 20171208205122) do

  create_table "bikes", force: :cascade do |t|
    t.string  "make"
    t.string  "model"
    t.string  "bike_type"
    t.integer "frame_size"
    t.text    "maintenance_log"
    t.integer "cyclist_id"
  end

  create_table "cyclists", force: :cascade do |t|
    t.string  "username"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.integer "age"
    t.string  "password_digest"
  end

  create_table "rides", force: :cascade do |t|
    t.string  "name"
    t.float   "distance_miles"
    t.integer "climbing_feet"
    t.string  "terrain"
    t.date    "ride_date"
    t.float   "duration_hours"
    t.integer "bike_id"
  end

end
