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

ActiveRecord::Schema.define(version: 2022_02_07_013143) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 1
  end

  create_table "moviments", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "role"
    t.decimal "value"
    t.date "date"
    t.integer "client_origin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_moviments_on_client_id"
  end

  add_foreign_key "moviments", "clients"
  add_foreign_key "moviments", "clients", column: "client_origin_id"
end
