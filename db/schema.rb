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

ActiveRecord::Schema.define(version: 2020_11_14_150321) do

  create_table "aditionals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "aditionals_rutas", id: false, force: :cascade do |t|
    t.integer "ruta_id"
    t.integer "aditional_id"
    t.index ["aditional_id"], name: "index_aditionals_rutas_on_aditional_id"
    t.index ["ruta_id"], name: "index_aditionals_rutas_on_ruta_id"
  end

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
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.date "fecha_nacimiento"
    t.string "telefono"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_chofers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_chofers_on_reset_password_token", unique: true
  end

  create_table "ciudades", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "combis", force: :cascade do |t|
    t.string "patente"
    t.string "cantidad_de_asientos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rutas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "origen_id"
    t.integer "destino_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.date "fecha_nacimiento"
    t.string "telefono"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "viajes", force: :cascade do |t|
    t.string "nombre"
    t.datetime "fecha_y_hora"
    t.time "duracion"
    t.integer "ruta_id"
    t.integer "chofer_id"
    t.integer "combi_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
