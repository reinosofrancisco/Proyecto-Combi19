class Combi < ApplicationRecord
   validates :patente , presence: true, uniqueness: true
   validates :tipo, presence: true
   validates :en_viaje , presence: true
   validates :nro_combi, presence: true, uniqueness: true
  default_scope -> {order(:nro_combi)}
end
