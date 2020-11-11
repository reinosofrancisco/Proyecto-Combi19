class CreateRutas < ActiveRecord::Migration[6.0]
  def change
    create_table :rutas do |t|
      t.string :origen
      t.string :destino

      t.timestamps
    end
  end
end







#Va en el modelo

class OrigenDestinoValidator < ActiveModel::Validator
  def validate(record)
      if record[:origen].eql? record[:destino]
          record.errors.add :base, "Origen y destino no pueden ser iguales"      
      end
end
end

class Ruta < ApplicationRecord
  has_and_belongs_to_many :aditionals
  #has_many :aditional_ruta_table
  #has_many :aditionals, through :aditional_ruta_table
  validates :origen, presence: true
  validates :destino, presence: true 
  validates_uniqueness_of :origen, :scope => :destino
  validates_with OrigenDestinoValidator,fields: [:origen, :destino]
end
