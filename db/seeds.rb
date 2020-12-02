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

Ruta.destroy_all
Adicional.destroy_all
Admin.destroy_all
User.destroy_all




a1=Adicional.find_or_create_by(
    nombre: "Equipaje extra 5kg",
    descripcion: "Para poder llevar equipaje extra",
    precio: 2005.35
)
a2=Adicional.find_or_create_by(
    nombre: "Equipaje extra 10kg",
    descripcion: "Para poder llevar equipaje extra",
    precio: 2005.35
)
a3=Adicional.find_or_create_by(
    nombre: "Un alfajor",
    descripcion: "Adicional para disfrutar un alfajor a bordo de la combi",
    precio: 2005.35
)
a4=Adicional.find_or_create_by(
    nombre: "Refresco",
    descripcion: "Adicional para tener un refresco a bordo de la combi",
    precio: 2005.35
)
a5=Adicional.find_or_create_by(
    nombre: "Recuerdo de viaje",
    descripcion: "Este adicional provee un recuerdo del destino que hallas escogido(personalizado por cada viaje)",
    precio: 2005.35
)

#Administrador Generico de prueba
Admin.create(email: "admin@hotmail.com", password: "admin1234", password_confirmation: "admin1234")

#Usuario Generico de prueba
User.create(
  email: "admin@hotmail.com", password: "admin1234", password_confirmation: "admin1234",
  nombre: Faker::Name.first_name, apellido: Faker::Name.last_name,
  fecha_nacimiento: Faker::Date.birthday(min_age: 18, max_age: 65),
  dni: rand(45555555 .. 99999999), telefono: Faker::PhoneNumber.phone_number)


#Genero 10 usuarios aleatorios
User.populate 10 do |u|
  u.nombre = Faker::Name.first_name
  u.apellido = Faker::Name.last_name
  u.fecha_nacimiento = Faker::Date.birthday(min_age: 18, max_age: 65)
  u.email = Faker::Internet.email
  u.dni = rand(45555555 .. 99999999)
  u.encrypted_password = "KASJDIJASLD"
  u.telefono = Faker::PhoneNumber.phone_number
end
