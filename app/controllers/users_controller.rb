class UsersController < ApplicationController
  def show

    #Si borras esto no se crea el comentario

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
    @viajesPendientes=@viajesPendientes.sort_by(&:fecha)
    @viajesPasados=@viajesPasados.sort_by(&:fecha)


  end


  def getComentario(v,u)
    return Comentario.where(viaje_id: v).where(user_id: u).first
    
  end
  helper_method :getComentario






end
