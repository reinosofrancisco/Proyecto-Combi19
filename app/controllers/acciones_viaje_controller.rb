class AccionesViajeController < ApplicationController

    #Se accede a este método al presionar cancelar
    def cancelar
        #cancelar con las reglas de cancelacion
        pasaje=Pasaje.where(viaje_id: params[:viaje_id]).where(user_id: current_user.id).first
        fecha_deHoy= Date.today
        #logica de control
        viaje= Viaje.find_by_id(pasaje.viaje_id)
        if (Viaje.find_by_id(pasaje.viaje_id).asientos_restantes !=nil)
          Viaje.find_by_id(pasaje.viaje_id).asientos_restantes = (Viaje.find_by_id(pasaje.viaje_id).asientos_restantes) + 1
        end
        pasaje.destroy
        if(viaje.fecha.day - fecha_deHoy.day > 3)
            redirect_to user_info_path(current_user.id),notice: "Se le reintegro el 100% del costo del viaje"
        elsif (viaje.fecha.day - fecha_deHoy.day >1)
            redirect_to user_info_path(current_user.id),notice: "Se le reintegro el 50% del costo del viaje"
        else
            redirect_to user_info_path(current_user.id),notice: "Se le reintegro el 0% del costo del viaje"
        end


        
        #redirect_to(:back)
    end

    def comentar
        @viaje_id=params[:viaje_id]
    end

    def comentarPost
        comentario=Comentario.new
        comentario.mensaje=params[:mensaje]
        comentario.user_id=current_user.id
        comentario.viaje_id=params[:viaje_id]

        #comentario=params.require.permit....
        comentario.save
        redirect_to user_info_path(current_user.id)
        
        

    end

    def borrarComentario
        Comentario.find_by_id(params[:comentario_id]).destroy
        flash[:alert] = "Comentario Eliminado."
        redirect_to user_info_path(current_user.id)
    end




end
