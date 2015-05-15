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

ActiveRecord::Schema.define(version: 20150513064546) do

  create_table "app_statuses", force: :cascade do |t|
    t.boolean  "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "student_application_id"
    t.integer  "reviewer_id"
    t.string   "student_name"
  end

  add_index "app_statuses", ["reviewer_id"], name: "index_app_statuses_on_reviewer_id"
  add_index "app_statuses", ["student_application_id"], name: "index_app_statuses_on_student_application_id"

  create_table "reviewers", force: :cascade do |t|
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

  add_index "reviewers", ["email"], name: "index_reviewers_on_email", unique: true
  add_index "reviewers", ["reset_password_token"], name: "index_reviewers_on_reset_password_token", unique: true

  create_table "student_applications", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email_id"
    t.decimal  "gpa",                 precision: 4, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "student_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "sop_file_name"
    t.string   "sop_content_type"
    t.integer  "sop_file_size"
    t.datetime "sop_updated_at"
    t.string   "lor_file_name"
    t.string   "lor_content_type"
    t.integer  "lor_file_size"
    t.datetime "lor_updated_at"
  end

  add_index "student_applications", ["student_id"], name: "index_student_applications_on_student_id", unique: true

  create_table "students", force: :cascade do |t|
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

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true

end
