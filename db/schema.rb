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

ActiveRecord::Schema.define(version: 20140909150331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "temple_id"
    t.integer  "guess_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["correct"], name: "index_answers_on_correct", using: :btree
  add_index "answers", ["guess_id"], name: "index_answers_on_guess_id", using: :btree
  add_index "answers", ["temple_id"], name: "index_answers_on_temple_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "continents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "continents", ["name"], name: "index_continents_on_name", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "continent_id"
  end

  add_index "countries", ["continent_id"], name: "index_countries_on_continent_id", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree

  create_table "photos", force: true do |t|
    t.string   "link"
    t.integer  "temple_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["temple_id"], name: "index_photos_on_temple_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
  add_index "states", ["name"], name: "index_states_on_name", using: :btree

  create_table "team_members", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id", using: :btree
  add_index "team_members", ["user_id"], name: "index_team_members_on_user_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "leader_id"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "temples", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "state_id"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  add_index "temples", ["country_id"], name: "index_temples_on_country_id", using: :btree
  add_index "temples", ["state_id"], name: "index_temples_on_state_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
