class Aditional < ApplicationRecord

    has_and_belongs_to_many :rutas

    #has_many :aditional_ruta_table
    #has_many :rutas, through :aditional_ruta_table
end
