class Combi < ApplicationRecord
   validates :patente , presence: true, uniqueness: true
   validates :cantidad_de_asientos, presence: true
  default_scope -> {order(:patente)}
end
