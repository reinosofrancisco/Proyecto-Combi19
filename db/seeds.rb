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



a1=Aditional.find_or_create_by(
    name: "Equipaje extra 5kg",
    description: "Sisi, equipaje extra podes llevar pagando bro"
)
a2=Aditional.find_or_create_by(
    name: "Equipaje extra 10kg",
    description: "Sisi, diez kilos de equipaje extra podes llevar pagando bro"
)
a3=Aditional.find_or_create_by(
    name: "Caremelos owo",
    description: "Me aseguro que no tengas hambre, te doy caramelos"
)
a4=Aditional.find_or_create_by(
    name: "Awa",
    description: "Me aseguro de que te hidrates dandote awa"
)
a5=Aditional.find_or_create_by(
    name: "Cogida",
    description: "Me aseguro de que la pases bien, te cojo uwu"
)



Ruta.find_or_create_by(
    origen: "La Plata",
    destino: "Buenos Aires",
    aditionals_ids: [a1,a2,a3]
)
Ruta.find_or_create_by(
    origen: "La Plata",
    destino: "BuRSACO",
    aditionals_ids: a2
)
Ruta.find_or_create_by(
    origen: "Mar del Plata",
    destino: "Buenos Aires",
    aditionals_ids: a3
)
Ruta.find_or_create_by(
    origen: "El Condor",
    destino: "Buenos Aires",
    aditionals_ids: a4
)
Ruta.find_or_create_by(
    origen: "Buenos Aires",
    destino: "Mar del Plata",
    aditionals_ids: [a1,a2,a3,a4,a5]
)