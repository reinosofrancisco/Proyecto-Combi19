class UsersController < ApplicationController
  def show

    #Si borras esto no se crea el comentario
    @comentario = Comentario.new(user_id: current_user.id)

   @user = User.find_by_id(params[:id])
   @comentarios = User.find_by_id(params[:id]).comentarios
   #Tambien puedo usar current_user que provee devise
   #@user = current_user
  end





end
