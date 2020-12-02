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
    @viajesPasados=[]
    t= Date.today
    aux.each do |a|
      v=Viaje.find_by_id(a.viaje_id)
      if(v.fecha>=t)
        @viajesPendientes=@viajesPendientes.append(v)
      else
        @viajesPasados=@viajesPasados.append(v)
      end
        
    end


  end





end
