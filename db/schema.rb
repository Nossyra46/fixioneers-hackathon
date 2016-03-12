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

ActiveRecord::Schema.define(version: 20160312173919) do

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "refugees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "phone_number"
    t.string   "locale"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "refugees_roles", id: false, force: :cascade do |t|
    t.integer "refugee_id"
    t.integer "role_id"
  end

  add_index "refugees_roles", ["refugee_id", "role_id"], name: "index_refugees_roles_on_refugee_id_and_role_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

end
