class Ciudad < ApplicationRecord
    validates :nombre, uniqueness: true, presence: true

    has_many :rutas, foreign_key: :origen,  :dependent => :destroy
    has_many :rutas, foreign_key: :destino,  :dependent => :destroy

    def destroy

        if !(Ruta.where(origen:self).empty? && Ruta.where(destino:self).empty?)
          errors[:nombre] << "Chofer no puede eliminarse"
          return false
        else
          super
        end
      end


end
