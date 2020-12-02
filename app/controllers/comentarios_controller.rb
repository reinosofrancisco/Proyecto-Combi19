class ComentariosController < ApplicationController

  def create
    @comentario = Comentario.new(
      params.require(:comentario).permit(:mensaje, :user_id, :viaje_id),


    )
    if @comentario.save
      redirect_to root_path
    else
      render :new
    end
  end



end
