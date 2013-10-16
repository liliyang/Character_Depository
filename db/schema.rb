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

ActiveRecord::Schema.define(version: 20131016210659) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "pronunciation"
    t.string   "character_type"
    t.string   "rank"
    t.integer  "age"
    t.string   "gender"
    t.string   "location",       default: "Arolos Weyr"
    t.text     "description"
    t.text     "personality"
    t.text     "history"
    t.date     "birthdate"
    t.integer  "pet_count",      default: 0
    t.boolean  "rider",          default: false
    t.boolean  "candidate",      default: false
    t.boolean  "crafter",        default: false
    t.boolean  "holder",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "craft"
    t.integer  "user_id"
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "dragons", force: true do |t|
    t.integer  "rider_id"
    t.string   "name"
    t.string   "color"
    t.integer  "age"
    t.text     "description"
    t.text     "personality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dragons", ["rider_id"], name: "index_dragons_on_rider_id"

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "pet_type"
    t.text     "description"
    t.text     "personality"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  add_index "pets", ["character_id"], name: "index_pets_on_character_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
