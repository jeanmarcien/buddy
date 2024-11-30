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

ActiveRecord::Schema[7.1].define(version: 2024_11_30_203705) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measurements", force: :cascade do |t|
    t.integer "measurement_type", null: false
    t.float "value"
    t.date "date"
    t.bigint "pet_id", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_measurements_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "specie"
    t.string "breed"
    t.date "birth_day"
    t.string "gender"
    t.bigint "user_id", null: false
    t.bigint "vet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
    t.index ["vet_id"], name: "index_pets_on_vet_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.integer "treatment_type", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "dosage"
    t.string "frequency"
    t.text "notes"
    t.date "renew_date"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_treatments_on_pet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vet_appointments", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.bigint "vet_id", null: false
    t.datetime "date"
    t.string "reason"
    t.text "notes"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_vet_appointments_on_pet_id"
    t.index ["vet_id"], name: "index_vet_appointments_on_vet_id"
  end

  create_table "vets", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "measurements", "pets"
  add_foreign_key "pets", "users"
  add_foreign_key "pets", "vets"
  add_foreign_key "treatments", "pets"
  add_foreign_key "vet_appointments", "pets"
  add_foreign_key "vet_appointments", "vets"
end
