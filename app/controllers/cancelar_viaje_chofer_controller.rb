class CancelarViajeChoferController < ApplicationController
  def cancelar
    @viaje_id= Pasaje.find_by_id(params[:pasaje_id]).viaje_id
  end
end
