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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_11_25_193215) do
=======
ActiveRecord::Schema.define(version: 2020_11_25_180450) do
>>>>>>> ea81597fc508126f6f0eac6ef139de8511275937

  create_table "adicionales", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.float "precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "adicionales_rutas", id: false, force: :cascade do |t|
    t.integer "ruta_id"
    t.integer "adicional_id"
    t.index ["adicional_id"], name: "index_adicionales_rutas_on_adicional_id"
    t.index ["ruta_id"], name: "index_adicionales_rutas_on_ruta_id"
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
    t.bigint "dni"
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
    t.integer "provincia_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "combis", force: :cascade do |t|
    t.string "patente"
    t.integer "cantidad_de_asientos"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "mensaje"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comentarios_on_user_id"
  end

  create_table "provincia", force: :cascade do |t|
    t.string "nombre"
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
    t.string "nombre"
    t.string "apellido"
    t.bigint "dni"
    t.date "fecha_nacimiento"
    t.string "telefono"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_viajes", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "viaje_id"
    t.index ["user_id"], name: "index_users_viajes_on_user_id"
    t.index ["viaje_id"], name: "index_users_viajes_on_viaje_id"
  end

  create_table "viajes", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha"
    t.time "hora_salida"
    t.time "duracion"
    t.integer "ruta_id"
    t.integer "chofer_id"
    t.integer "combi_id"
    t.float "precio"
    t.integer "asientos_restantes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
