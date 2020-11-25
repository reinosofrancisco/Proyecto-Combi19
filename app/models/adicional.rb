class Adicional < ApplicationRecord

    #has_and_belongs_to_many :rutas
    validates :nombre, presence:true, uniqueness: true
    validates :precio, presence:true
    #has_many :aditional_ruta_table
    #has_many :rutas, through :aditional_ruta_table
end
