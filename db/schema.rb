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

ActiveRecord::Schema.define(:version => 20111028131500) do

  create_table "appointments", :force => true do |t|
    t.datetime "date"
    t.integer  "duration"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["doctor_id"], :name => "index_appointments_on_doctor_id"
  add_index "appointments", ["patient_id"], :name => "index_appointments_on_patient_id"

  create_table "clinic_infos", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors_specialties", :id => false, :force => true do |t|
    t.integer "doctor_id",    :null => false
    t.integer "specialty_id", :null => false
  end

  add_index "doctors_specialties", ["doctor_id"], :name => "index_doctors_specialties_on_doctor_id"
  add_index "doctors_specialties", ["specialty_id"], :name => "index_doctors_specialties_on_specialty_id"

  create_table "schedule_plans", :force => true do |t|
    t.date     "start"
    t.date     "end"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedule_plans", ["doctor_id"], :name => "index_schedule_plans_on_doctor_id"

  create_table "schedules", :force => true do |t|
    t.integer  "weekday"
    t.time     "start"
    t.time     "end"
    t.integer  "schedule_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["schedule_plan_id"], :name => "index_schedules_on_schedule_plan_id"

  create_table "specialties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "passwordhash"
    t.string   "salt"
    t.string   "name"
    t.date     "birthdate"
    t.string   "address"
    t.boolean  "male"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
  end

end
