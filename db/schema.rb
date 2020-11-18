# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_08_225155) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "chofers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.string "telefono"
    t.index ["email"], name: "index_chofers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_chofers_on_reset_password_token", unique: true
  end

  create_table "combis", force: :cascade do |t|
    t.string "patente"
    t.string "tipo"
    t.boolean "en_viaje"
    t.integer "nro_combi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
<<<<<<< HEAD
    t.integer "edad"
    t.string "nombre"
=======
    t.string "nombre"
<<<<<<< HEAD
=======
>>>>>>> 59fb47556f6038bb66fb98f5453840a5df162a7a
    t.date "fecha_nacimiento"
    t.string "apellido"
    t.string "dni"
    t.string "telefono"
>>>>>>> 7970d0e16786961b6621a0d50210ac5b1d9c852b
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
  create_table "viajes", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha"
    t.time "duracion"
    t.integer "ruta_id"
    t.integer "chofer_id"
    t.integer "combi_id"
    t.time "hora_salida"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

=======
>>>>>>> 59fb47556f6038bb66fb98f5453840a5df162a7a
end
