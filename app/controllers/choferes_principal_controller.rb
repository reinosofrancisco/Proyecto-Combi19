class ChoferesPrincipalController < ApplicationController
  def ver_viaje
    fecha= Date.today
    viaje= Viaje.where((['fecha >= ? AND fecha < ?', fecha, fecha+100])).where(chofer_id:current_chofer).order(:fecha)
    @pasajes= nil
    if(viaje != nil)
      viaje.each  do |v|
        p= Pasaje.where(viaje_id: v.id).first
        if(p != nil)
          if(p.estado == nil)
              @pasajes= Pasaje.where(viaje_id: v.id)
              break
        end
      end
      end
    end
    @f = User.new
  end
end
