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

ActiveRecord::Schema.define(version: 20151009125529) do

  create_table "ledgers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
  end

  add_index "ledgers", ["user_id"], name: "index_ledgers_on_user_id"

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "cookie_hash"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "user_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "name"
    t.text     "description"
  end

  add_index "transactions", ["receiver_id"], name: "index_transactions_on_receiver_id"
  add_index "transactions", ["sender_id"], name: "index_transactions_on_sender_id"
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "public_key"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
