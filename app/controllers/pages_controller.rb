class PagesController < ApplicationController
  def home
  end

  def ver_viajes
    t= Date.today
    @viajes = Viaje.where(['fecha > ? AND fecha < ?', t, t+100])
  end
end
