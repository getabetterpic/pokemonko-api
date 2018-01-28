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

ActiveRecord::Schema.define(version: 20180128140915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pko_cards", force: :cascade do |t|
    t.string "card_id", null: false
    t.string "name", null: false
    t.integer "national_pokedex_number"
    t.string "image_url"
    t.string "image_url_hi_res"
    t.string "subtype"
    t.string "supertype"
    t.jsonb "ability"
    t.jsonb "ancient_trait"
    t.string "hp"
    t.string "number"
    t.string "artist"
    t.string "rarity"
    t.string "series"
    t.string "set_code"
    t.jsonb "retreat_cost"
    t.jsonb "text"
    t.jsonb "types"
    t.jsonb "attacks"
    t.jsonb "weaknesses"
    t.jsonb "resistances"
    t.string "evolves_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_pko_cards_on_card_id", unique: true
    t.index ["set_code"], name: "index_pko_cards_on_set_code"
  end

  create_table "pko_sets", force: :cascade do |t|
    t.string "code", null: false
    t.string "name"
    t.string "series"
    t.integer "total_cards"
    t.boolean "standard_legal"
    t.boolean "expanded_legal"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_pko_sets_on_code", unique: true
  end

end
