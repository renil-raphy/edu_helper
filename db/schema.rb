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

ActiveRecord::Schema.define(version: 20180208182818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name",                                           null: false
    t.string   "profile_picture_url"
    t.string   "phone"
    t.string   "role",                   default: "super_admin", null: false
    t.string   "status",                 default: "active",      null: false
    t.string   "email",                  default: "",            null: false
    t.string   "encrypted_password",     default: "",            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,             null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "question_id", null: false
    t.integer  "category_id", null: false
    t.integer  "weightage",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_answers_on_category_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "slug",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "description"
    t.text     "carriers",    default: [],              array: true
  end

  create_table "college_courses", force: :cascade do |t|
    t.integer  "college_id",    null: false
    t.integer  "course_id",     null: false
    t.string   "with_subjects"
    t.integer  "no_of_seats"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["college_id"], name: "index_college_courses_on_college_id", using: :btree
    t.index ["course_id"], name: "index_college_courses_on_course_id", using: :btree
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "slug",          null: false
    t.text     "address"
    t.string   "phone"
    t.string   "website"
    t.integer  "university_id", null: false
    t.integer  "location_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["location_id"], name: "index_colleges_on_location_id", using: :btree
    t.index ["university_id"], name: "index_colleges_on_university_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "slug",        null: false
    t.text     "description"
    t.string   "duration"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "slug",        null: false
    t.integer  "district_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_locations_on_district_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "qn_text",     null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_questions_on_category_id", using: :btree
  end

  create_table "universities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.string   "website"
    t.string   "phone"
    t.text     "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_categories", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "category_id",     null: false
    t.integer  "total_weightage", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["category_id"], name: "index_user_categories_on_category_id", using: :btree
    t.index ["user_id"], name: "index_user_categories_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.integer  "district_id"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["district_id"], name: "index_users_on_district_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
