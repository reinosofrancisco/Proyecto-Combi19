class ChoferesPrincipalController < ApplicationController
  def ver_viaje
    fecha= Date.today
    viaje= Viaje.where((['fecha >= ? AND fecha < ?', fecha, fecha+100])).where(chofer_id:current_chofer).order(:fecha).first
    @f = User.new
    if(viaje != nil)
      @pasajes= Pasaje.where(viaje_id: viaje.id)
    end
  end






end
