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

ActiveRecord::Schema[7.0].define(version: 2022_12_07_164944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_services", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additional_services_orders", id: false, force: :cascade do |t|
    t.bigint "additional_service_id", null: false
    t.bigint "order_id", null: false
  end

  create_table "capacities", force: :cascade do |t|
    t.float "width"
    t.float "height"
    t.float "length"
    t.float "num_of_pallets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargo_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "capacity_id", null: false
    t.index ["capacity_id"], name: "index_cars_on_capacity_id"
  end

  create_table "delivery_types", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "phone"
    t.integer "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "car_id", null: false
    t.bigint "route_id", null: false
    t.bigint "cargo_type_id", null: false
    t.bigint "delivery_type_id", null: false
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["cargo_type_id"], name: "index_orders_on_cargo_type_id"
    t.index ["delivery_type_id"], name: "index_orders_on_delivery_type_id"
    t.index ["route_id"], name: "index_orders_on_route_id"
  end

  create_table "points", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "start_point_id"
    t.bigint "end_point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_point_id"], name: "index_routes_on_end_point_id"
    t.index ["start_point_id"], name: "index_routes_on_start_point_id"
  end

  add_foreign_key "cars", "capacities"
  add_foreign_key "orders", "cargo_types"
  add_foreign_key "orders", "cars"
  add_foreign_key "orders", "delivery_types"
  add_foreign_key "orders", "routes"
  add_foreign_key "routes", "points", column: "end_point_id"
  add_foreign_key "routes", "points", column: "start_point_id"
end
