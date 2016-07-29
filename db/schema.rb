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

ActiveRecord::Schema.define(version: 20160728012007) do

  create_table "committees", id: false, force: :cascade do |t|
    t.string   "position",             limit: 255
    t.integer  "player_id",            limit: 4
    t.string   "committee_email",      limit: 255
    t.datetime "office_hours_start_1"
    t.datetime "office_hours_end_1"
    t.datetime "office_hours_start_2"
    t.datetime "office_hours_end_2"
    t.string   "head_of_league",       limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

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

  create_table "leagues", id: false, force: :cascade do |t|
    t.integer  "season_id",         limit: 4
    t.string   "league",            limit: 255
    t.string   "league_head_name",  limit: 255
    t.string   "league_head_email", limit: 255
    t.string   "full_league_name",  limit: 255
    t.string   "preferred_rink",    limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "leagues", ["league"], name: "index_leagues_on_league", using: :btree

  create_table "news_articles", force: :cascade do |t|
    t.string   "title",             limit: 30
    t.string   "short_description", limit: 140
    t.string   "picture_path",      limit: 255,   default: "/assets/default_pic.png"
    t.text     "news_body",         limit: 65535
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
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
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "players", ["mtu_id", "full_name"], name: "index_players_on_mtu_id_and_full_name", using: :btree

  create_table "rinks", id: false, force: :cascade do |t|
    t.integer  "season_id",    limit: 4
    t.string   "rink_name",    limit: 255
    t.string   "display_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rinks", ["season_id", "rink_name"], name: "index_rinks_on_season_id_and_rink_name", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",            limit: 75
    t.integer  "league_id",       limit: 4
    t.integer  "conference_id",   limit: 4
    t.integer  "captain_id",      limit: 4
    t.integer  "season_id",       limit: 4
    t.boolean  "valid_team"
    t.string   "team_pic_path",   limit: 255, default: "/assets/default_pic.png"
    t.integer  "wins",            limit: 4
    t.integer  "losses",          limit: 4
    t.integer  "overtime_losses", limit: 4
    t.integer  "points",          limit: 4
    t.integer  "goals_for",       limit: 4
    t.integer  "goals against",   limit: 4
    t.integer  "conference_rank", limit: 4
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "teams", ["name", "league_id", "conference_id"], name: "index_teams_on_name_and_league_id_and_conference_id", using: :btree

end
