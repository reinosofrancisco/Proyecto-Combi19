class VerRutasController < ApplicationController
  def show
    @rutas = Ruta.where(origen_id: params[:id]) + Ruta.where(destino_id: params[:id])
  end
end
