class PagesController < ApplicationController
  def home
  end

  def ver_viajes
    @viajes = Viaje.all
  end

end
