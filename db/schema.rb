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

ActiveRecord::Schema.define(version: 20160816210851) do

  create_table "conferences", force: :cascade do |t|
    t.string   "league_id",  limit: 255
    t.integer  "number",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "conferences", ["league_id"], name: "index_conferences_on_league_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "rink_id",       limit: 255
    t.string   "home_team_id",  limit: 255
    t.string   "away_team_id",  limit: 255
    t.string   "home_goals",    limit: 255
    t.string   "away_goals",    limit: 255
    t.string   "overtime_loss", limit: 255
    t.string   "video_url",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "invoice_id",  limit: 255
    t.decimal  "amount_paid",             precision: 8, scale: 2
    t.boolean  "late"
    t.datetime "due_date"
    t.string   "team_id",     limit: 255
    t.string   "player_id",   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title",        limit: 30
    t.string   "picture_path", limit: 255,   default: "/assets/default_pic.png"
    t.text     "news_body",    limit: 65535
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "player_seasons", force: :cascade do |t|
    t.integer  "players_id",                limit: 4
    t.integer  "season_id",                 limit: 4
    t.boolean  "attended_captains_meeting"
    t.string   "residency_league",          limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practice_rink_reservations", force: :cascade do |t|
    t.string   "team_id",    limit: 255
    t.boolean  "paid"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
