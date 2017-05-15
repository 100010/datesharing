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

ActiveRecord::Schema.define(version: 20170428170146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_goods_on_plan_id", using: :btree
    t.index ["user_id"], name: "index_goods_on_user_id", using: :btree
  end

  create_table "plan_details", force: :cascade do |t|
    t.string   "name",                             null: false
    t.time     "start_time",                       null: false
    t.time     "end_time",                         null: false
    t.string   "place",                            null: false
    t.text     "content"
    t.integer  "price",                            null: false
    t.integer  "validity",   limit: 2, default: 1, null: false
    t.integer  "plan_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["plan_id"], name: "index_plan_details_on_plan_id", using: :btree
  end

  create_table "planners", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.string   "occupation"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_planners_on_user_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "title",                               default: "", null: false
    t.string   "thubnail",                            default: "", null: false
    t.text     "description",                         default: "", null: false
    t.integer  "planner_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "place",                                            null: false
    t.string   "main_image"
    t.datetime "start_date",                                       null: false
    t.datetime "end_date",                                         null: false
    t.integer  "start_favorability_rating",                        null: false
    t.integer  "end_favorability_rating",                          null: false
    t.integer  "status",                                           null: false
    t.integer  "validity",                  limit: 2, default: 1,  null: false
    t.index ["planner_id"], name: "index_plans_on_planner_id", using: :btree
  end

  create_table "staff_logs", force: :cascade do |t|
    t.string   "ip",         null: false
    t.string   "username",   null: false
    t.string   "action",     null: false
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_staff_logs_on_staff_id", using: :btree
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.string   "email",                                 null: false
    t.string   "password_digest",                       null: false
    t.integer  "status",                                null: false
    t.integer  "validity",        limit: 2, default: 1, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "goods", "plans"
  add_foreign_key "goods", "users"
end
