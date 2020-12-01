class PagesController < ApplicationController
  def home
  end

  def ver_viajes
    @destino_id = params[:destino_id]
    @origen_id = params[:origen_id]
    @fecha = params[:fecha]
    v= nil
    if (@origen_id ==nil &&  @destino_id == nil)
      t= Date.today
      @viajes = Viaje.where(['fecha > ? AND fecha < ?', t, t+100])
  elsif (@origen_id .present?)
      rutas= Ruta.where(origen_id: @origen_id)
      rutas.each do |r|
        if (v == nil)
          v =Viaje.where(ruta: r)
        else v = v + Viaje.where(ruta: r)
        end
      end
      if (@destino_id.present?)
        rutas= Ruta.where(destino_id: @destino_id)
        rutas.each do |r|
          if (v == nil)
            v =Viaje.where(ruta: r)
            else v = v + Viaje.where(ruta: r)
            end
          end
        @viajes= v.uniq
    end
    end
  end
 end
