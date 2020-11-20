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
Aditional.destroy_all
Admin.destroy_all



a1=Aditional.find_or_create_by(
    name: "Equipaje extra 5kg",
    description: "Para poder llevar equipaje extra"
)
a2=Aditional.find_or_create_by(
    name: "Equipaje extra 10kg",
    description: "Para poder llevar equipaje extra"
)
a3=Aditional.find_or_create_by(
    name: "Un alfajor",
    description: "Adicional para disfrutar un alfajor a bordo de la combi"
)
a4=Aditional.find_or_create_by(
    name: "Refresco",
    description: "Adicional para tener un refresco a bordo de la combi"
)
a5=Aditional.find_or_create_by(
    name: "Recuerdo de viaje",
    description: "Este adicional provee un recuerdo del destino que hallas escogido(personalizado por cada viaje)"
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
