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

ActiveRecord::Schema.define(version: 20160725023320) do

  create_table "committees", id: false, force: :cascade do |t|
    t.string   "position",        limit: 255
    t.integer  "player_id",       limit: 4
    t.string   "committee_email", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title",      limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "mtu_id",           limit: 15
    t.string   "first_name",       limit: 25
    t.string   "last_name",        limit: 25
    t.string   "full_name",        limit: 50
    t.string   "nickname",         limit: 40
    t.string   "email",            limit: 40
    t.string   "profile_pic_path", limit: 255, default: "/assets/default_pic.png"
    t.string   "major",            limit: 30
    t.string   "hometown",         limit: 30
    t.string   "position",         limit: 30
    t.integer  "height_feet",      limit: 4
    t.integer  "height_inches",    limit: 4
    t.integer  "weight",           limit: 4
    t.integer  "years_played",     limit: 4
    t.text     "description",      limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["full_name"], name: "index_players_on_full_name", using: :btree

  create_table "rinks", force: :cascade do |t|
    t.integer  "season_id",    limit: 4
    t.string   "rink_name",    limit: 255
    t.string   "display_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",          limit: 40
    t.string   "league",        limit: 255
    t.string   "conference",    limit: 255
    t.integer  "captain_id",    limit: 4
    t.string   "team_pic_path", limit: 255, default: "/assets/default_pic.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
