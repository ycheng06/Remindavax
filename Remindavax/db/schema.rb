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

ActiveRecord::Schema.define(:version => 20120727052010) do

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dosages", :force => true do |t|
    t.string   "unit"
    t.decimal  "amount"
    t.integer  "drug_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.string   "treatmentname"
    t.integer  "days_worth_of_medication"
    t.date     "refill_date"
    t.integer  "patient_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "frequencies", :force => true do |t|
    t.integer  "times_per_day"
    t.integer  "days_per_week"
    t.integer  "weeks_per_month"
    t.integer  "drug_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "relation_to_sponsor"
    t.integer  "doctor_id"
    t.integer  "sponsor_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "preferred_times", :force => true do |t|
    t.time     "time_to_receive_reminder"
    t.integer  "setting_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "settings", :force => true do |t|
    t.boolean  "send_by_text"
    t.boolean  "send_by_email"
    t.boolean  "reminder_summary"
    t.boolean  "reminder_preferred_times"
    t.boolean  "is_active"
    t.integer  "patient_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "patient_id"
  end

  add_index "settings", ["patient_id"], :name => "index_settings_on_patient_id"

  create_table "sponsors", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
