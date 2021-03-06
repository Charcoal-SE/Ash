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

ActiveRecord::Schema.define(version: 20160905150921) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "org"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "site_count", default: 0
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "key"
    t.string   "app_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "registrars", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "site_count", default: 0
  end

  create_table "teches", force: :cascade do |t|
    t.string   "name"
    t.string   "org"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "site_count", default: 0
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.boolean  "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "websites", force: :cascade do |t|
    t.string   "url"
    t.integer  "post_count"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name_server"
    t.integer  "registrar_id"
    t.integer  "admin_id"
    t.integer  "tech_id"
    t.index ["admin_id"], name: "index_websites_on_admin_id"
    t.index ["registrar_id"], name: "index_websites_on_registrar_id"
    t.index ["tech_id"], name: "index_websites_on_tech_id"
  end

end
