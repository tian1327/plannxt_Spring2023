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

ActiveRecord::Schema[7.0].define(version: 2023_02_21_091511) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventsteps", force: :cascade do |t|
    t.bigint "plan_model_id", null: false
    t.string "name"
    t.date "start_date"
    t.time "start_time"
    t.date "end_date"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_model_id"], name: "index_eventsteps_on_plan_model_id"
  end

  create_table "plan_models", force: :cascade do |t|
    t.string "name"
    t.text "data"
    t.integer "creator"
    t.string "editPermission"
    t.string "viewPermission"
    t.string "extra1"
    t.string "extra2"
    t.string "extra3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator"], name: "index_plan_models_on_creator"
  end

  create_table "users", force: :cascade do |t|
    t.integer "level"
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "viewPermission"
    t.string "editPermission"
    t.text "description"
    t.string "extra1"
    t.string "extra2"
    t.string "extra3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "eventsteps", "plan_models"
end
