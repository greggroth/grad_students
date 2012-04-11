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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120411183603) do

  create_table "committees", :force => true do |t|
    t.integer  "student_id"
    t.integer  "professor_id"
    t.boolean  "ms_chair"
    t.boolean  "phd_chair"
    t.boolean  "ms"
    t.boolean  "phd"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "meeting_attendances", :force => true do |t|
    t.integer  "student_id"
    t.integer  "meeting_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meetings", :force => true do |t|
    t.datetime "date"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "legacy_id"
  end

  create_table "professors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "legacy_id"
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "graduate_advisor",       :default => false, :null => false
    t.boolean  "undergraduate_advisor",  :default => false, :null => false
    t.boolean  "department_chair",       :default => false, :null => false
    t.string   "phone"
  end

  add_index "professors", ["email"], :name => "index_professors_on_email", :unique => true
  add_index "professors", ["reset_password_token"], :name => "index_professors_on_reset_password_token", :unique => true

  create_table "qualifiers", :force => true do |t|
    t.boolean  "class_mech",   :default => false, :null => false
    t.boolean  "stat_mech",    :default => false, :null => false
    t.boolean  "em",           :default => false, :null => false
    t.boolean  "quantum",      :default => false, :null => false
    t.integer  "attempts",     :default => 1
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "student_id"
    t.boolean  "biophysics"
    t.boolean  "astrophysics"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "year_entered"
    t.integer  "ms_year"
    t.integer  "phd_year"
    t.string   "ms_semester"
    t.string   "phd_semester"
    t.string   "panther_id"
    t.string   "alt_research_1"
    t.string   "alt_research_2"
    t.integer  "year_left"
    t.string   "semester_left"
    t.boolean  "citi_online"
    t.boolean  "citi_discussion"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "email_1"
    t.string   "email_2"
    t.string   "phone"
    t.integer  "legacy_id"
    t.string   "lab_phone"
    t.boolean  "thesis_ms"
    t.string   "degree",          :default => "PhD"
    t.string   "status",          :default => "Current student"
    t.text     "notes"
    t.decimal  "stipend"
  end

end
