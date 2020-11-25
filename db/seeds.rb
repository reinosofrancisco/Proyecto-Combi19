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



Ruta.destroy_all
Adicional.destroy_all
Admin.destroy_all




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


#
# Ruta.find_or_create_by(
#     origen: "La Plata",
#     destino: "Buenos Aires",
#     aditionals_ids: [a1,a2,a3]
# )
# Ruta.find_or_create_by(
#     origen: "La Plata",
#     destino: "BuRSACO",
#     aditionals_ids: a2
# )
# Ruta.find_or_create_by(
#     origen: "Mar del Plata",
#     destino: "Buenos Aires",
#     aditionals_ids: a3
# )
# Ruta.find_or_create_by(
#     origen: "El Condor",
#     destino: "Buenos Aires",
#     aditionals_ids: a4
# )
# Ruta.find_or_create_by(
#     origen: "Buenos Aires",
#     destino: "Mar del Plata",
#     aditionals_ids: [a1,a2,a3,a4,a5]
# )


Admin.create(email: "admin@hotmail.com", password: "admin1234", password_confirmation: "admin1234")
