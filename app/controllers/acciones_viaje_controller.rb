class AccionesViajeController < ApplicationController

    #Se accede a este método al presionar cancelar
    def cancelar
        #cancelar con las reglas de cancelacion
        pasaje=params[:pasaje]
        
        #logica de control


        byebug
        #redirect_to(:back)
    end


end
