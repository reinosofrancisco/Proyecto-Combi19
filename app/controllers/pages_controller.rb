class PagesController < ApplicationController
  def home
  end

  def ver_viajes


    t= Date.today
    @viajes = Viaje.where(['fecha > ? AND fecha < ?', t, t+100])

    #Agarra 5 comentarios al azar
    @comentarios = Comentario.all.sample(5)
    @users=User.all
    @destino_id = params[:destino_id]
    @origen_id = params[:origen_id]
    if params[:viaje] != nil
      @fecha = params[:viaje][:fecha]
    end
    if (@origen_id .present?) && !(@destino_id .present?) && !(@fecha .present?)
      @viajes= @viajes.where(ruta: Ruta.where(origen_id: @origen_id))
      elsif !(@origen_id .present?) && (@destino_id .present?) && !(@fecha .present?)
        @viajes= @viajes.where(ruta: Ruta.where(destino_id: @destino_id))
        elsif !(@origen_id .present?) && !(@destino_id .present?) && (@fecha .present?)
          @viajes= @viajes.where(fecha: @fecha)
          elsif (@origen_id .present?) && (@destino_id .present?) && !(@fecha .present?)
            @viajes= @viajes.where(ruta: Ruta.where(origen_id: @origen_id)).where(ruta: Ruta.where(destino_id: @destino_id))
            elsif (@origen_id .present?) && !(@destino_id .present?) && (@fecha .present?)
              @viajes= @viajes.where(ruta: Ruta.where(origen_id: @origen_id)).where(fecha: @fecha)
              elsif !(@origen_id .present?) && (@destino_id .present?) && (@fecha .present?)
                @viajes= @viajes.where(ruta: Ruta.where(destino_id: @destino_id)).where(fecha: @fecha)
                elsif (@origen_id .present?) && (@destino_id .present?) && (@fecha .present?)
                  @viajes= @viajes.where(ruta: Ruta.where(origen_id: @origen_id)).where(ruta: Ruta.where(destino_id: @destino_id)).where(fecha: @fecha)
    end
  end
end
