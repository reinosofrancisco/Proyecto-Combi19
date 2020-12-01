class ArmadoPasajeController < ApplicationController
    def main


        @viaje=Viaje.find_by_id(params[:viaje_id])
        if(@viaje==nil)
            redirect_to viajes_path
        else
            @adicionales=@viaje.ruta.adicionales
        end






    end


end
