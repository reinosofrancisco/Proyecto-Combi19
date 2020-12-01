class Viaje < ApplicationRecord
  validates :duracion , presence: true
  validates :fecha, presence: true
  validates :hora_salida, presence: true
  belongs_to :combi , class_name: 'Combi'
  belongs_to :chofer, class_name: 'Chofer'
  belongs_to :ruta , class_name: 'Ruta'
  validates :precio, presence:true
  default_scope -> {order(:nombre)}


  has_and_belongs_to_many :users
  validate :combi_no_ocupada
  validate :chofer_no_ocupado
  validate :fecha_pasada
  #validate :asientos_en_rango
  validate :agregar_asientos

  #Valida que la combi a utilizar en el viaje no este ocupada

  def agregar_asientos
    self.asientos_restantes = self.combi.cantidad_de_asientos - self.users.length
  end
  protected

  # validate :validaciones_generales
  # def validaciones_generales
  #   combi_no_ocupada
  #   chofer_no_ocupado
  # end






  def combi_no_ocupada
    viajes= Viaje.where(combi:combi).where(fecha: fecha)
    if viajes != nil
      viajes.each do |viaje|
        next if viaje==self
        if(viaje.hora_salida + viaje.duracion).change(year: hora_salida.year , month: hora_salida.month , day: hora_salida.day) > hora_salida
          errors[:combi] << 'La combi seleccionada esta ocupada'
        end
      end
  end
end
  #Valida que el chofer a utilizar en el viaje no este ocupado
  protected
  def chofer_no_ocupado
    viajes= Viaje.where(chofer: chofer).where(fecha: fecha)
    if viajes != nil
      viajes.each do |viaje|
        next if viaje==self
        if(viaje.hora_salida + viaje.duracion).change(year: hora_salida.year , month: hora_salida.month , day: hora_salida.day) > hora_salida
            errors[:chofer] << 'El chofer seleccionado esta ocupado'
        end
      end
  end
  end
  protected
  def fecha_pasada
    fecha_y_hora = DateTime.new(fecha.year,fecha.month, fecha.day, hora_salida.hour, hora_salida.min, hora_salida.sec )
      if(fecha_y_hora.to_s(:number) <= Time.now.to_s(:number))
        errors[:fecha] << 'La fecha seleccionada es anterior al dia de hoy'
      end
  end
  def destroy
      if !(self.users.empty?)
        errors[:nombre] << "Viaje no puede eliminarse"
        return false
      else
        super
      end
    end
end
