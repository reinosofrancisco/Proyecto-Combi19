# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# encoding: UTF-8

require_relative '../lib/populator_fix.rb'


Adicional.destroy_all
Admin.destroy_all
User.destroy_all
Provincia.destroy_all
Combi.delete_all
Comentario.destroy_all
#No puedo usar Destroy
Viaje.delete_all
Ciudad.delete_all
Ruta.delete_all
Chofer.delete_all






#Administrador Generico de prueba
Admin.create(email: "admin@hotmail.com", password: "admin1234", password_confirmation: "admin1234")

#Usuario Generico de prueba
User.create(
  email: "admin@hotmail.com", password: "admin1234", password_confirmation: "admin1234",
  nombre: Faker::Name.first_name, apellido: Faker::Name.last_name,
  fecha_nacimiento: Faker::Date.birthday(min_age: 18, max_age: 65),
  dni: rand(45555555 .. 99999999), telefono: Faker::PhoneNumber.phone_number)

#Chofer Generico de prueba
Chofer.create(
  email: "admin@hotmail.com", password: "admin1234", password_confirmation: "admin1234",
  nombre: Faker::Name.first_name, apellido: Faker::Name.last_name,
  fecha_nacimiento: Faker::Date.birthday(min_age: 18, max_age: 65),
  dni: rand(45555555 .. 99999999), telefono: Faker::PhoneNumber.phone_number)








#Genero adicionales aleatorios
Adicional.populate 5 do |u|
  u.nombre = Faker::Food.dish
  u.descripcion = Faker::Food.description
  u.precio = rand(50..500)
end

#Genero usuarios aleatorios
User.populate 5 do |u|
  u.nombre = Faker::Name.first_name
  u.apellido = Faker::Name.last_name
  u.fecha_nacimiento = Faker::Date.birthday(min_age: 18, max_age: 65)
  u.email = Faker::Internet.email
  u.dni = rand(45555555 .. 99999999)
  u.encrypted_password = "KASJDIJASLD"
  u.telefono = Faker::PhoneNumber.phone_number
end

#Provincias y ciudades
Provincia.populate 4 do |j|
  j.nombre = Faker::Address.state

  Ciudad.populate 1 do |k|
    k.nombre = Faker::Address.city
    k.provincia_id = j.id
  end

end

#Genero una ruta de prueba
Ruta.populate 1 do |j|
  j.nombre = Faker::Mountain.range
  j.origen_id = Ciudad.all.sample.id
  j.destino_id = Ciudad.all.sample.id
end

#Genero 10 choferes de prueba
Chofer.populate 4 do |u|
  u.nombre = Faker::Name.first_name
  u.apellido = Faker::Name.last_name
  u.fecha_nacimiento = Faker::Date.birthday(min_age: 18, max_age: 65)
  u.email = Faker::Internet.email
  u.dni = rand(45555555 .. 99999999)
  u.encrypted_password = "KASJDIJASLD"
  u.telefono = Faker::PhoneNumber.phone_number
end

#Genero combis de prueba
Combi.populate 4 do |u|
  u.cantidad_de_asientos = 12
  u.patente = Faker::Vehicle.license_plate
end



#Genero un viaje de prueba
Viaje.populate 1 do |j|
  j.nombre = Faker::Space.nebula
  j.fecha = Faker::Date.forward(days: 5)
  j.hora_salida = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  j.duracion = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  j.ruta_id = Ruta.all.sample.id
  j.chofer_id = Chofer.all.sample.id
  j.combi_id = Combi.all.sample.id
end

#Genero 10 comentarios de prueba
Comentario.populate 4 do |u|
  u.mensaje = Faker::ChuckNorris.fact
  u.user_id = User.all.sample.id
  u.viaje_id = Viaje.all.sample.id
end
