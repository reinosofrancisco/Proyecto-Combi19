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

  def destroy
    Comentario.find(params[:id]).destroy
    flash[:success] = "Comentario Eliminado."
    redirect_to root_path
  end



end
