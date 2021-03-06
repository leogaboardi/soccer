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

ActiveRecord::Schema.define(version: 20150128021344) do

  create_table "bets", force: true do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.integer  "bet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coefficients", force: true do |t|
    t.integer  "user_id"
    t.decimal  "value"
    t.text     "scope"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.string   "tournament"
    t.string   "label"
    t.integer  "round"
    t.date     "match_on"
    t.time     "match_at"
    t.string   "venue_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_goal"
    t.integer  "away_goal"
    t.integer  "outcome"
    t.integer  "user_id"
    t.integer  "attendance"
    t.integer  "attendance_prediction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "label"
    t.string   "crest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "label"
    t.string   "address"
    t.string   "picture_url"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
