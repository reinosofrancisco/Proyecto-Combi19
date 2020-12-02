class Ciudad < ApplicationRecord
    validates :nombre, presence: true

    has_many :rutas, foreign_key: :origen,  :dependent => :destroy
    has_many :rutas, foreign_key: :destino,  :dependent => :destroy
    belongs_to :provincia, class_name: 'Provincia'
    validate :ciudad_no_repetida;
    protected
    
    def ciudad_no_repetida
      if !(Ciudad.where(provincia_id:provincia_id).where(nombre:nombre).empty?)
        errors[:nombre] << 'La ciudad ingresada ya se encuentra cargada'
      end
    end

    def destroy

        if !(Ruta.where(origen:self).empty? && Ruta.where(destino:self).empty?)
          errors[:nombre] << "Chofer no puede eliminarse"
          return false
        else
          super
        end
      end
      def boton_rutas
        link_to 'Ver Viajes', 'pages#ver_rutas' , class: "a-primary"
      end

end
