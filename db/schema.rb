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

ActiveRecord::Schema.define(version: 2021_10_11_015026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "slug", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_players_on_slug", unique: true
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.integer "api_id", null: false
    t.integer "base_experience", null: false
    t.string "slug", null: false
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_pokemons_on_player_id"
    t.index ["slug"], name: "index_pokemons_on_slug", unique: true
  end

  create_table "pokemons_trade_objects", id: false, force: :cascade do |t|
    t.bigint "trade_object_id", null: false
    t.bigint "pokemon_id", null: false
    t.index ["pokemon_id", "trade_object_id"], name: "index_pokemons_trade_objects_on_pokemon_id_and_trade_object_id"
    t.index ["trade_object_id", "pokemon_id"], name: "index_pokemons_trade_objects_on_trade_object_id_and_pokemon_id"
  end

  create_table "trade_objects", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "trade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_trade_objects_on_player_id"
    t.index ["trade_id"], name: "index_trade_objects_on_trade_id"
  end

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemons", "players"
  add_foreign_key "trade_objects", "players"
  add_foreign_key "trade_objects", "trades"
end
