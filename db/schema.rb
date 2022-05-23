# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_23_134143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dwarves", force: :cascade do |t|
    t.string "name"
    t.string "sexe"
    t.string "origin"
    t.integer "age"
    t.float "size"
    t.text "description"
    t.float "price"
    t.string "city"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dwarves_on_user_id"
  end

  create_table "job_dwarves", force: :cascade do |t|
    t.bigint "dwarf_id", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dwarf_id"], name: "index_job_dwarves_on_dwarf_id"
    t.index ["job_id"], name: "index_job_dwarves_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "type"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "validation", default: false
    t.bigint "user_id", null: false
    t.bigint "dwarf_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dwarf_id"], name: "index_reservations_on_dwarf_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "dwarf_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dwarf_id"], name: "index_reviews_on_dwarf_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "dwarves", "users"
  add_foreign_key "job_dwarves", "dwarves"
  add_foreign_key "job_dwarves", "jobs"
  add_foreign_key "reservations", "dwarves"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "dwarves"
  add_foreign_key "reviews", "users"
end
