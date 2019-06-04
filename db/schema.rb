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

ActiveRecord::Schema.define(version: 2019_04_16_132516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "description"
    t.datetime "date"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "mid"
    t.integer "indication"
    t.index ["ticket_id"], name: "index_activities_on_ticket_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name", default: "0"
    t.string "segments"
    t.string "department"
    t.bigint "company_id"
    t.bigint "user_id"
    t.string "matricula"
    t.index ["company_id"], name: "index_clients_on_company_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_courses_on_company_id"
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "user_id"
    t.index ["company_id"], name: "index_responsibles_on_company_id"
    t.index ["user_id"], name: "index_responsibles_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_sources_on_company_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "name"
    t.string "telephone"
    t.string "question"
    t.string "status"
    t.string "email"
    t.decimal "total"
    t.bigint "responsible_id"
    t.string "final"
    t.string "mid"
    t.bigint "source_id"
    t.index ["client_id"], name: "index_tickets_on_client_id"
    t.index ["company_id"], name: "index_tickets_on_company_id"
    t.index ["course_id"], name: "index_tickets_on_course_id"
    t.index ["responsible_id"], name: "index_tickets_on_responsible_id"
    t.index ["source_id"], name: "index_tickets_on_source_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "kind"
    t.bigint "company_id"
    t.boolean "admin", default: false
    t.boolean "salesman"
    t.boolean "superadmin"
    t.boolean "manager"
    t.bigint "responsible_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["responsible_id"], name: "index_users_on_responsible_id"
  end

  add_foreign_key "activities", "tickets"
  add_foreign_key "activities", "users"
  add_foreign_key "clients", "companies"
  add_foreign_key "clients", "users"
  add_foreign_key "courses", "companies"
  add_foreign_key "responsibles", "companies"
  add_foreign_key "responsibles", "users"
  add_foreign_key "sources", "companies"
  add_foreign_key "tickets", "clients"
  add_foreign_key "tickets", "companies"
  add_foreign_key "tickets", "courses"
  add_foreign_key "tickets", "responsibles"
  add_foreign_key "tickets", "sources"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "responsibles"
end
