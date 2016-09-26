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

ActiveRecord::Schema.define(version: 20160926081127) do

  create_table "games", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "runs_count",         default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "runs", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_runs_on_game_id"
    t.index ["player_id"], name: "index_runs_on_player_id"
    t.index ["team_id"], name: "index_runs_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "runs_count", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["player_id"], name: "index_videos_on_player_id"
  end

end
