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

ActiveRecord::Schema.define(version: 20150403054022) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "angel_tags", force: true do |t|
    t.integer  "tag_id"
    t.string   "tag_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "basic_profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "maiden_name"
    t.string   "formatted_name"
    t.string   "headline"
    t.string   "location"
    t.string   "industry"
    t.string   "summary"
    t.string   "specialties"
    t.string   "picture_url"
    t.string   "public_profile_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.string   "school_name"
    t.string   "field_of_study"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "degree"
    t.string   "activities"
    t.string   "notes"
    t.integer  "full_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fav_jobs", force: true do |t|
    t.string   "job_key"
    t.boolean  "is_fav"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "full_profiles", force: true do |t|
    t.string   "associations"
    t.string   "honors"
    t.string   "interests"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ims", force: true do |t|
    t.string   "im_account_type"
    t.string   "im_account_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linkedin_oauth_settings", force: true do |t|
    t.string   "atoken"
    t.string   "asecret"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_nos", force: true do |t|
    t.string   "phone_type"
    t.integer  "phone_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.string   "title"
    t.string   "summary"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_current"
    t.string   "company"
    t.integer  "full_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.integer  "skill_id"
    t.string   "name"
    t.integer  "full_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end