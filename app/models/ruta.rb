class Ruta < ApplicationRecord
    has_and_belongs_to_many :aditionals
    #has_many :aditional_ruta_table
    #has_many :aditionals, through :aditional_ruta_table

end
