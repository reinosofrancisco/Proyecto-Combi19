class Viaje < ApplicationRecord
  validates :duracion , presence: true
  validates :fecha, presence: true
  validates :hora_salida , presence: true
  belongs_to :combi , class_name: 'Combi'
  belongs_to :chofer, class_name: 'Chofer'
  belongs_to :ruta , class_name: 'Ruta'


  validate :combi_no_ocupada
  validate :chofer_no_ocupado
  validate :fecha_pasada

  #Valida que la combi a utilizar en el viaje no este ocupada


  protected

  # validate :validaciones_generales
  # def validaciones_generales
  #   combi_no_ocupada
  #   chofer_no_ocupado
  # end

  def combi_no_ocupada
    v= Viaje.where(combi:combi).where(fecha: fecha)
    if v != nil
      v.each do |viaje|
        if (viaje.hora_salida + viaje.duracion).to_s(:time) > hora_salida.to_s(:time)
            errors[:combi] << 'La combi seleccionada esta ocupada'
        end
      end
  end
end
  #Valida que el chofer a utilizar en el viaje no este ocupado
  protected
  def chofer_no_ocupado
    v= Viaje.where(chofer: chofer).where(fecha: fecha)
    if v != nil
      v.each do |viaje|
        if (viaje.hora_salida + viaje.duracion).to_s(:time) > hora_salida.to_s(:time)
            errors[:chofer] << 'El chofer seleccionado esta ocupado'
        end
      end
  end
  end
  protected
  def fecha_pasada
      f= Time.now();
      if(fecha < f)
        errors[:fecha] << 'La fecha seleccionada es anterior al dia de hoy'
      end
  end
end
