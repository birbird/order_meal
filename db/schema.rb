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

ActiveRecord::Schema.define(version: 20140323111529) do

  create_table "orders", force: true do |t|
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "customer_mobile"
    t.integer  "product_id"
    t.string   "delivery_man"
    t.boolean  "is_complete"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count"
    t.date     "_date"
  end

  add_index "orders", ["product_id"], name: "index_orders_on_product_id"

  create_table "orders_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
  end

  add_index "orders_products", ["order_id"], name: "index_orders_products_on_order_id"
  add_index "orders_products", ["product_id"], name: "index_orders_products_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quota", force: true do |t|
    t.date     "_date"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quota", ["product_id"], name: "index_quota_on_product_id"

end
