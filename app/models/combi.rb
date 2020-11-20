class Combi < ApplicationRecord
   validates :patente , presence: true, uniqueness: true
   validates :cantidad_de_asientos, presence: true
  default_scope -> {order(:patente)}

def destroy

    if !(Viaje.where(combi:self).empty?)
      errors[:nombre] << "Chofer no puede eliminarse"
      return false
    else
      super
    end
  end
end
