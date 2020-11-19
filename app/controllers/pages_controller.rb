class PagesController < ApplicationController
  def home
  end

  def ver_viajes
    t= Date.today
    @viajes = Viaje.where(['fecha_y_hora > ? AND fecha_y_hora < ?', t, t+100])
  end

end
