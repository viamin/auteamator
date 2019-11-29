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

ActiveRecord::Schema.define(version: 2019_11_29_033938) do

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

  create_table "contracts", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "club_id"
    t.integer "status"
    t.datetime "first_active"
    t.datetime "last_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_contracts_on_club_id"
    t.index ["player_id"], name: "index_contracts_on_player_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.bigint "location_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_fields_on_location_id"
  end

  create_table "football_associations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
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
    t.string "url"
    t.index ["football_association_id"], name: "index_leagues_on_football_association_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "map"
    t.string "name"
    t.boolean "all_weather"
    t.integer "fields_count", default: 0, null: false
    t.boolean "lights"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "kickoff"
    t.jsonb "result"
    t.bigint "field_id"
    t.bigint "home_team_id"
    t.bigint "season_id"
    t.bigint "visiting_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_matches_on_field_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["season_id"], name: "index_matches_on_season_id"
    t.index ["visiting_team_id"], name: "index_matches_on_visiting_team_id"
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

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title"
    t.datetime "starts"
    t.datetime "ends"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "club_id"
    t.bigint "league_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["club_id"], name: "index_teams_on_club_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
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

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "contracts", "clubs"
  add_foreign_key "contracts", "players"
  add_foreign_key "fields", "locations"
  add_foreign_key "leagues", "football_associations"
  add_foreign_key "matches", "fields"
  add_foreign_key "matches", "seasons"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "matches", "teams", column: "visiting_team_id"
  add_foreign_key "teams", "clubs"
  add_foreign_key "teams", "leagues"
end
