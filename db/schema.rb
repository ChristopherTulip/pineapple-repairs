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

ActiveRecord::Schema.define(version: 20140523203325) do

  create_table "contractors", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.boolean  "verified",               default: false
  end

  add_index "contractors", ["email"], name: "index_contractors_on_email", unique: true
  add_index "contractors", ["reset_password_token"], name: "index_contractors_on_reset_password_token", unique: true

  create_table "devices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "device_id"
    t.integer  "model_id"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_id"
    t.integer  "location_id"
    t.integer  "contractor_id"
    t.boolean  "finished",      default: false
  end

  add_index "jobs", ["network_id"], name: "index_jobs_on_network_id"

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "country"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.integer  "time"
  end

  create_table "networks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
