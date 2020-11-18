class Viaje < ApplicationRecord
  validates :duracion , presence: true
  validates :fecha_y_hora, presence: true
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
    viajes= Viaje.where(combi:combi).where(fecha_y_hora: fecha_y_hora)
    if viajes != nil
      viajes.each do |viaje|
        if(viaje.fecha_y_hora + viaje.duracion) > fecha_y_hora
          errors[:combi] << 'La combi seleccionada esta ocupada'
        end
      end
  end
end
  #Valida que el chofer a utilizar en el viaje no este ocupado
  protected
  def chofer_no_ocupado
    viajes= Viaje.where(chofer: chofer).where(fecha_y_hora: fecha_y_hora)
    if viajes != nil
      viajes.each do |viaje|
        if(viaje.fecha_y_hora + viaje.duracion) > fecha_y_hora
            errors[:chofer] << 'El chofer seleccionado esta ocupado'
        end
      end
  end
  end
  protected
  def fecha_pasada
      if(fecha_y_hora.to_s(:number) <= Time.now.to_s(:number))
        errors[:fecha] << 'La fecha seleccionada es anterior al dia de hoy'
      end
  end
end
