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

ActiveRecord::Schema.define(version: 2018_02_12_012928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "deck_cards", id: false, force: :cascade do |t|
    t.bigint "deck_id", null: false
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_deck_cards_on_card_id"
    t.index ["deck_id"], name: "index_deck_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "valid_deck"
    t.boolean "standard_legal"
    t.boolean "expanded_legal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

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

  create_table "users", force: :cascade do |t|
    t.citext "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
