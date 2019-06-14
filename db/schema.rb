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

ActiveRecord::Schema.define(version: 2019_06_11_205100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codemedications", force: :cascade do |t|
    t.string "drug"
    t.string "dose"
    t.string "time"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_codemedications_on_code_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "begin_time"
    t.string "end_time"
    t.string "patient_status"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_codes_on_patient_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.string "route"
    t.string "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_medications", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "medication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_patient_medications_on_medication_id"
    t.index ["patient_id"], name: "index_patient_medications_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "history"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "rhythms", force: :cascade do |t|
    t.string "rhythm"
    t.string "time"
    t.boolean "pulse"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_rhythms_on_code_id"
  end

  create_table "shocks", force: :cascade do |t|
    t.string "time"
    t.string "energy"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_id"], name: "index_shocks_on_code_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vitalsets", force: :cascade do |t|
    t.string "bloodpressure"
    t.string "pulse"
    t.string "temperature"
    t.string "spo2"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_vitalsets_on_patient_id"
  end

  add_foreign_key "patient_medications", "medications"
  add_foreign_key "patient_medications", "patients"
end
