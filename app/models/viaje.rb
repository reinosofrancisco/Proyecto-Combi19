class Viaje < ApplicationRecord
  validates :duracion , presence: true
  validates :fecha, presence: true
  belongs_to :combi , class_name: 'Combi'
  belongs_to :chofer, class_name: 'Chofer'
  belongs_to :ruta , class_name: 'Ruta'

end
