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

ActiveRecord::Schema.define(version: 20151106201453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "completion_time"
    t.string   "content_type"
    t.string   "link"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "like_count",      default: 0
  end

  create_table "activities_interests", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "interest_id", null: false
  end

  create_table "custom_activities", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "completion_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "custom_activities", ["user_id"], name: "index_custom_activities_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "interest_id", null: false
  end

  add_index "interests_users", ["interest_id", "user_id"], name: "index_interests_users_on_interest_id_and_user_id", using: :btree
  add_index "interests_users", ["user_id", "interest_id"], name: "index_interests_users_on_user_id_and_interest_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "role",                        default: 0
    t.string   "activation_digest"
    t.boolean  "activated",                   default: false
    t.datetime "activated_at"
    t.integer  "liked_list",                  default: [],                 array: true
    t.integer  "disliked_list",               default: [],                 array: true
    t.integer  "completed_activities",        default: [],                 array: true
    t.integer  "completed_custom_activities", default: [],                 array: true
  end

  add_foreign_key "custom_activities", "users"
end
