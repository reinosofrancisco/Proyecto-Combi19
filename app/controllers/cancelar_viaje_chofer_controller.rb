class CancelarViajeChoferController < ApplicationController
  def cancelar
  end

  def motivo
    @viaje_id= Pasaje.find_by_id(params[:pasaje_id]).viaje_id
    pasajes= Pasaje.where(viaje_id: @viaje_id)
    guarde= true
    if pasajes != nil
      pasajes.each do |p|
          p.estado = params[:mensaje]
        guarde= guarde && p.save
      end
       if guarde
         redirect_to chofer_path , notice: "El viaje fue cancelado con exito"
       end
    end
  end
end
