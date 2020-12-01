class PagesController < ApplicationController
  def home
  end

  def ver_viajes
<<<<<<< HEAD
    t= Date.today
    @viajes = Viaje.where(['fecha > ? AND fecha < ?', t, t+100])
    @comentarios = Comentario.all
=======
    @destino_id = params[:destino_id]
    @origen_id = params[:origen_id]
    @fecha = params[:fecha]
    v=nil
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
>>>>>>> b03e2d8133d8c9dee1c5871cfcaaecdd2f9b9c7c
  end
end
