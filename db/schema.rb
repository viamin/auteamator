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

ActiveRecord::Schema.define(version: 2019_01_17_214427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "football_association_id"
    t.index ["football_association_id"], name: "index_clubs_on_football_association_id"
  end

  create_table "football_associations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.bigint "football_association_id"
    t.string "name"
    t.integer "level"
    t.boolean "relegation"
    t.string "description"
    t.string "day"
    t.string "format"
    t.string "skill_level"
    t.string "age_restriction"
    t.string "gender_restriction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_association_id"], name: "index_leagues_on_football_association_id"
  end

  create_table "players", force: :cascade do |t|
    t.citext "email"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.string "positions"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "leagues", "football_associations"
end
