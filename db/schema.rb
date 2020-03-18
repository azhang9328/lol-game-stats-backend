# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_18_045639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string "name"
    t.integer "riot_id"
    t.string "title"
    t.jsonb "image"
    t.string "skins", default: [], array: true
    t.string "lore"
    t.string "blurb"
    t.string "allytips", default: [], array: true
    t.string "enemytips", default: [], array: true
    t.string "tags", default: [], array: true
    t.string "partype"
    t.jsonb "info"
    t.jsonb "stats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gpcs", force: :cascade do |t|
    t.bigint "champion_id", null: false
    t.bigint "game_id", null: false
    t.bigint "summoner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champion_id"], name: "index_gpcs_on_champion_id"
    t.index ["game_id"], name: "index_gpcs_on_game_id"
    t.index ["summoner_id"], name: "index_gpcs_on_summoner_id"
  end

  create_table "gpcs_runes", force: :cascade do |t|
    t.bigint "gpc_id", null: false
    t.bigint "rune_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gpc_id"], name: "index_gpcs_runes_on_gpc_id"
    t.index ["rune_id"], name: "index_gpcs_runes_on_rune_id"
  end

  create_table "gpcs_spells", force: :cascade do |t|
    t.bigint "gpc_id", null: false
    t.bigint "spell_id", null: false
    t.index ["gpc_id"], name: "index_gpcs_spells_on_gpc_id"
    t.index ["spell_id"], name: "index_gpcs_spells_on_spell_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "riot_id"
    t.string "colloq"
    t.string "description"
    t.string "plaintext"
    t.integer "stacks"
    t.string "from", default: [], array: true
    t.string "into", default: [], array: true
    t.jsonb "image_instructions"
    t.string "full_image"
    t.string "small_image"
    t.string "tiny_image"
    t.jsonb "gold"
    t.string "tags", default: [], array: true
    t.jsonb "stats"
    t.jsonb "effect"
    t.boolean "inStore"
    t.string "requiredChampion"
    t.string "requiredAlly"
    t.integer "depth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passives", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.jsonb "image"
    t.bigint "champion_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champion_id"], name: "index_passives_on_champion_id"
  end

  create_table "runes", force: :cascade do |t|
    t.integer "riot_id"
    t.string "name"
    t.string "icon"
    t.string "shortDesc"
    t.string "longDesc"
    t.string "rune_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spells", force: :cascade do |t|
    t.bigint "champion_id"
    t.string "name"
    t.string "riot_id"
    t.string "description"
    t.string "tooltip"
    t.integer "maxrank"
    t.integer "cooldown", default: [], array: true
    t.integer "cost", default: [], array: true
    t.jsonb "effect"
    t.jsonb "vars"
    t.string "costType"
    t.integer "range", default: [], array: true
    t.jsonb "image"
    t.string "resource"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champion_id"], name: "index_spells_on_champion_id"
  end

  create_table "summoners", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "gpcs", "champions"
  add_foreign_key "gpcs", "games"
  add_foreign_key "gpcs", "summoners"
  add_foreign_key "gpcs_runes", "gpcs"
  add_foreign_key "gpcs_runes", "runes"
  add_foreign_key "gpcs_spells", "gpcs"
  add_foreign_key "gpcs_spells", "spells"
end
