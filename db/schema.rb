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

ActiveRecord::Schema.define(version: 2018_10_27_230242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lap_racers", force: :cascade do |t|
    t.datetime "lap_time", null: false
    t.float "lap_duration", null: false
    t.float "lap_speed", null: false
    t.bigint "racer_id", null: false
    t.bigint "lap_id", null: false
    t.index ["lap_id"], name: "index_lap_racers_on_lap_id"
    t.index ["racer_id"], name: "index_lap_racers_on_racer_id"
  end

  create_table "laps", force: :cascade do |t|
    t.integer "lap_number", null: false
  end

  create_table "race_infos", force: :cascade do |t|
    t.integer "best_lap"
    t.float "time_best_lap"
    t.integer "number_laps"
    t.float "total_time"
    t.float "avg_speed"
    t.bigint "racer_id"
    t.index ["racer_id"], name: "index_race_infos_on_racer_id"
  end

  create_table "racers", force: :cascade do |t|
    t.integer "code", null: false
    t.string "name", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name", null: false
  end

  add_foreign_key "lap_racers", "laps"
  add_foreign_key "lap_racers", "racers"
end
