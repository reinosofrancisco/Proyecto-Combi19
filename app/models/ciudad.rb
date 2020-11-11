class Ciudad < ApplicationRecord
    validates :nombre, presence: true, uniqueness: true
    belongs_to :ruta, :dependent => :destroy, :inverse_of => :origen
    belongs_to :ruta, :dependent => :destroy, :inverse_of => :destino
end