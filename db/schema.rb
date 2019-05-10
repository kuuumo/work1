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

ActiveRecord::Schema.define(version: 2019_05_09_232451) do

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phonetic"
    t.string "email"
    t.integer "tel"
    t.string "company"
    t.string "department"
    t.string "position"
    t.integer "employee_num"
    t.string "company_location"
    t.integer "establishment_year"
    t.string "industry_type"
    t.string "ceo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_post_code"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
