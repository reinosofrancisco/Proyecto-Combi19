# class OrigenDestinoValidator < ActiveModel::Validator
#     def validate(record)
#         if record[:origen].eql? record[:destino]
#             record.errors.add :base, "Origen y destino no pueden ser iguales"      
#         end
#   end
#   end
  
  class Ruta < ApplicationRecord

    validates :nombre, uniqueness: true, presence: true
    has_one :origen, class_name: 'Ciudad', dependent: :destroy, :inverse_of => :ruta
    has_one :destino, class_name: 'Ciudad', dependent: :destroy, :inverse_of => :ruta
    #validates_uniqueness_of :origen, :scope => :destino


    has_and_belongs_to_many :aditionals
    #has_many :aditional_ruta_table
    #has_many :aditionals, through :aditional_ruta_table

    #validates :origen, presence: true
    #validates :destino, presence: true 
    
    #validates_with OrigenDestinoValidator,fields: [:origen, :destino]


  end