class Ciudad < ApplicationRecord
    validates :nombre, uniqueness: true, presence: true

    has_one :ruta, foreign_key: :origen,  :dependent => :destroy
    has_one :ruta, foreign_key: :destino,  :dependent => :destroy


end