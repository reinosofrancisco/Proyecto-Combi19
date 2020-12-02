class UsersController < ApplicationController
  def show

    #Si borras esto no se crea el comentario
    @comentario = Comentario.new(user_id: current_user.id)

    @user = User.find_by_id(params[:id])
    @comentarios = User.find_by_id(params[:id]).comentarios
    #Tambien puedo usar current_user que provee devise
    #@user = current_user
    # byebug  
    aux=Pasaje.where(user_id: @user.id)
    @viajesPendientes=[]
    aux.each do |a|
      @viajesPendientes=@viajesPendientes.append(Viaje.find_by_id(a.viaje_id))
    end

    @viajesPasados=@viajesPendientes.where(fecha:)


  end





end
