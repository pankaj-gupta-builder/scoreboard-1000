# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_05_29_074453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "status"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "winner_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.index ["game_id", "player_id"], name: "index_games_players_on_game_id_and_player_id", unique: true
    t.index ["player_id", "game_id"], name: "index_games_players_on_player_id_and_game_id", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.jsonb "stats"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.jsonb "scores"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  add_foreign_key "rounds", "games"
end
