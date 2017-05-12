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

ActiveRecord::Schema.define(version: 20170511184039) do

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rink_id"
    t.string "home_team_id"
    t.string "away_team_id"
    t.string "home_goals"
    t.string "away_goals"
    t.string "overtime_loss"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "goals"
    t.integer "assists"
    t.integer "save"
    t.integer "goals_allowed"
    t.integer "penalty_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "captain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.integer "team_id"
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "mtu_id", limit: 20
    t.string "first_name"
    t.string "last_name"
    t.string "nickname", limit: 60
    t.string "profile_pic"
    t.string "major", limit: 50
    t.string "hometown", limit: 50
    t.string "position", limit: 30
    t.integer "height_feet"
    t.integer "height_inches"
    t.integer "age"
    t.integer "years_played"
    t.integer "goals"
    t.integer "assists"
    t.text "description"
    t.boolean "committee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 75
    t.string "league"
    t.string "conference"
    t.integer "season_id"
    t.boolean "valid_team", default: false
    t.boolean "valid_name", default: false
    t.string "team_pic"
    t.integer "wins"
    t.integer "losses"
    t.integer "overtime_losses"
    t.integer "points"
    t.integer "goals_for"
    t.integer "goals against"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
