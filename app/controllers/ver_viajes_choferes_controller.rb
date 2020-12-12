class VerViajesChoferesController < ApplicationController
  def ver_viajes
    @viajes= Viaje.where(chofer_id: params[:id])
    if params[:viaje] != nil
      f= params[:viaje][:fecha].to_date()
      mes= f.month
      año= f.year
      fecha= Date.new(año, mes, 1)
      @viajes= Viaje.where((['fecha >= ? AND fecha < ?', fecha, fecha+30]))
    end
  end
end
