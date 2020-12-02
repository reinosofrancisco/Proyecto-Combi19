class AccionesViajeController < ApplicationController

    #Se accede a este método al presionar cancelar
    def cancelar
        #cancelar con las reglas de cancelacion
        pasaje=params[:pasaje]
        fecha_deHoy= Date.today
        #logica de control
        viaje= Viaje.find_by_id(pasaje.viaje_id)
        if(viaje.fecha.day - fecha_deHoy.day > 3)
          if (Viaje.find_by_id(pasaje.viaje_id).asientos_restantes !=nil)
            Viaje.find_by_id(pasaje.viaje_id).asientos_restantes = (Viaje.find_by_id(pasaje.viaje_id).asientos_restantes) + 1
          end
          pasaje.destroy
          #redirect_to (:back) ,notice: "Se le reintegro el 100% del costo del viaje"
        end
        byebug
        #redirect_to(:back)
    end


end
