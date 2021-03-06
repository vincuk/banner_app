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

ActiveRecord::Schema.define(version: 20170208185726) do

  create_table "clicks", force: true do |t|
    t.integer  "click_id",    limit: 255
    t.integer  "banner_id",   limit: 255
    t.integer  "campaign_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversions", force: true do |t|
    t.integer  "conversion_id", limit: 255
    t.integer  "click_id",      limit: 255
    t.decimal  "revenue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversions", ["click_id"], name: "index_conversions_on_click_id", unique: true

  create_table "impressions", force: true do |t|
    t.integer  "banner_id",   limit: 255
    t.integer  "campaign_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["campaign_id"], name: "index_impressions_on_campaign_id"

  create_table "users", force: true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["token"], name: "index_users_on_token"

end
