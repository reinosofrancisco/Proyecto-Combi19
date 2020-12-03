class ArmadoPasajeController < ApplicationController
    def main


        @viaje=Viaje.find_by_id(params[:viaje_id])
        if(@viaje==nil)
            redirect_to viajes_path
        elsif @viaje.asientos_restantes<=0
            flash[:danger] = "Viaje sin asientos disponibles"
            redirect_to viajes_path
        else
            @adicionales=@viaje.ruta.adicionales
        end






    end


end
