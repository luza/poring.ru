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

ActiveRecord::Schema.define(version: 0) do

  create_table "info_drop", force: :cascade do |t|
    t.integer "mob_id",  limit: 10, default: 0, null: false
    t.integer "item_id", limit: 10, default: 0, null: false
    t.integer "chance",  limit: 10, default: 0, null: false
    t.integer "renewal", limit: 1,  default: 0, null: false
  end

  add_index "info_drop", ["id"], name: "sqlite_autoindex_info_drop_1", unique: true

  create_table "info_items", force: :cascade do |t|
    t.string  "name",           limit: 255,               null: false
    t.string  "title",          limit: 255,               null: false
    t.integer "type",           limit: 10,  default: 0,   null: false
    t.integer "price",          limit: 10,  default: 0,   null: false
    t.integer "sell",           limit: 10,  default: 0,   null: false
    t.integer "weight",         limit: 10,  default: 0,   null: false
    t.integer "atk",            limit: 10,  default: 0,   null: false
    t.integer "def",            limit: 10,  default: 0,   null: false
    t.integer "range",          limit: 10,  default: 0,   null: false
    t.integer "slot",           limit: 10,  default: 0,   null: false
    t.string  "job",            limit: 16,  default: "0", null: false
    t.integer "upper",          limit: 1,                 null: false
    t.integer "gender",         limit: 10,  default: 0,   null: false
    t.integer "loc",            limit: 10,  default: 0,   null: false
    t.integer "wLV",            limit: 10,  default: 0,   null: false
    t.integer "eLV",            limit: 10,  default: 0,   null: false
    t.integer "refinable",      limit: 1,                 null: false
    t.integer "view",           limit: 10,  default: 0,   null: false
    t.string  "use-script",     limit: 255,               null: false
    t.string  "equip-script",   limit: 255,               null: false
    t.string  "unequip-script", limit: 255,               null: false
    t.integer "renewal",        limit: 1,   default: 0,   null: false
    t.integer "job_dec",        limit: 10,  default: 0,   null: false
  end

  add_index "info_items", ["id"], name: "sqlite_autoindex_info_items_1", unique: true

  create_table "info_itemsdesc", force: :cascade do |t|
    t.text "desc", null: false
  end

  add_index "info_itemsdesc", ["id"], name: "sqlite_autoindex_info_itemsdesc_1", unique: true

  create_table "info_maps", force: :cascade do |t|
    t.string "name", limit: 128, null: false
  end

  add_index "info_maps", ["id"], name: "sqlite_autoindex_info_maps_1", unique: true
  add_index "info_maps", ["name"], name: "info_maps_name"

  create_table "info_mapsizes", primary_key: "name", force: :cascade do |t|
    t.integer "width"
    t.integer "height"
  end

  add_index "info_mapsizes", ["name"], name: "sqlite_autoindex_info_mapsizes_1", unique: true

  create_table "info_mobs", force: :cascade do |t|
    t.string  "sprite_name", limit: 128,             null: false
    t.string  "name",        limit: 128,             null: false
    t.string  "j-name",      limit: 128,             null: false
    t.integer "level",       limit: 10,  default: 0, null: false
    t.integer "hp",          limit: 10,  default: 0, null: false
    t.integer "sp",          limit: 10,  default: 0, null: false
    t.integer "base-exp",    limit: 10,  default: 0, null: false
    t.integer "job-exp",     limit: 10,  default: 0, null: false
    t.integer "range",       limit: 1,   default: 0, null: false
    t.integer "min-atk",     limit: 10,  default: 0, null: false
    t.integer "max-atk",     limit: 10,  default: 0, null: false
    t.integer "defence",     limit: 10,  default: 0, null: false
    t.integer "m-defence",   limit: 10,  default: 0, null: false
    t.integer "STR",         limit: 10,  default: 0, null: false
    t.integer "AGI",         limit: 10,  default: 0, null: false
    t.integer "VIT",         limit: 10,  default: 0, null: false
    t.integer "INT",         limit: 10,  default: 0, null: false
    t.integer "DEX",         limit: 10,  default: 0, null: false
    t.integer "LUK",         limit: 10,  default: 0, null: false
    t.integer "min-range",   limit: 10,  default: 0, null: false
    t.integer "max-range",   limit: 10,  default: 0, null: false
    t.integer "scale",       limit: 10,  default: 0, null: false
    t.integer "race",        limit: 10,  default: 0, null: false
    t.integer "element",     limit: 10,  default: 0, null: false
    t.string  "mode",        limit: 10,              null: false
    t.integer "speed",       limit: 10,  default: 0, null: false
    t.integer "atack-delay", limit: 10,  default: 0, null: false
    t.integer "motin-a",     limit: 10,  default: 0, null: false
    t.integer "motin-d",     limit: 10,  default: 0, null: false
    t.integer "mexp",        limit: 11,              null: false
    t.integer "exp-per",     limit: 11,              null: false
    t.integer "qty",         limit: 11,              null: false
    t.integer "renewal",     limit: 1,   default: 0, null: false
    t.integer "mode_dec"
  end

  add_index "info_mobs", ["id"], name: "sqlite_autoindex_info_mobs_1", unique: true

  create_table "info_npc", force: :cascade do |t|
    t.integer "map_id",    limit: 11, null: false
    t.integer "master_id", limit: 11, null: false
    t.integer "x",         limit: 11, null: false
    t.integer "y",         limit: 11, null: false
    t.string  "name",      limit: 64, null: false
    t.integer "sprite",    limit: 11, null: false
  end

  add_index "info_npc", ["id"], name: "sqlite_autoindex_info_npc_1", unique: true
  add_index "info_npc", ["name"], name: "info_npc_name"
  add_index "info_npc", ["sprite"], name: "info_npc_sprite"

  create_table "info_npc_items", force: :cascade do |t|
    t.integer "npc_id",  limit: 11, null: false
    t.integer "item_id", limit: 11, null: false
    t.text    "type",               null: false
    t.integer "amount",  limit: 11, null: false
  end

  add_index "info_npc_items", ["id"], name: "sqlite_autoindex_info_npc_items_1", unique: true

  create_table "info_shops", force: :cascade do |t|
    t.integer "npc_id",  limit: 11, null: false
    t.integer "item_id", limit: 11, null: false
    t.integer "price",   limit: 11, null: false
  end

  add_index "info_shops", ["id"], name: "sqlite_autoindex_info_shops_1", unique: true

  create_table "info_spawn", force: :cascade do |t|
    t.integer "map_id",   limit: 11, default: 0
    t.integer "mob_id",   limit: 10, default: 0, null: false
    t.integer "count",    limit: 10, default: 0, null: false
    t.integer "min-time", limit: 10, default: 0, null: false
    t.integer "max-time", limit: 10, default: 0, null: false
    t.integer "event",    limit: 10, default: 0, null: false
  end

  add_index "info_spawn", ["id"], name: "sqlite_autoindex_info_spawn_1", unique: true

  create_table "info_warp", force: :cascade do |t|
    t.integer "map_id",      limit: 11, null: false
    t.integer "x",           limit: 11, null: false
    t.integer "y",           limit: 11, null: false
    t.integer "dest_map_id", limit: 11, null: false
    t.integer "dest_x",      limit: 11, null: false
    t.integer "dest_y",      limit: 11, null: false
  end

  add_index "info_warp", ["id"], name: "sqlite_autoindex_info_warp_1", unique: true

end
