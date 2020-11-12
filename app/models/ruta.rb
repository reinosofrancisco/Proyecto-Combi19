# class OrigenDestinoValidator < ActiveModel::Validator
#     def validate(record)
#         if record[:origen].eql? record[:destino]
#             record.errors.add :base, "Origen y destino no pueden ser iguales"      
#         end
#   end
#   end
  
  class Ruta < ApplicationRecord

    validates :nombre, uniqueness: true, presence: true

    #has_one :origen, class_name: 'Ciudad', dependent: :destroy
    #has_one :destino, class_name: 'Ciudad', dependent: :destroy

    belongs_to :origen, class_name: 'Ciudad'
    belongs_to :destino, class_name: 'Ciudad'


    #validates_uniqueness_of :origen_id, :scope => :destino_id


    #Valida que origen no sea igual a destino
    validate :origen_not_equals_destino

    protected
    def origen_not_equals_destino
       errors[:destino] << 'Origen no puede ser igual a destino' if origen.eql? destino
    end




    has_and_belongs_to_many :aditionals




    #has_many :aditional_ruta_table
    #has_many :aditionals, through :aditional_ruta_table

    #validates :origen, presence: true
    #validates :destino, presence: true 
    
    #validates_with OrigenDestinoValidator,fields: [:origen, :destino]


  end