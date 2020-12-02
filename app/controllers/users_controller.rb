class UsersController < ApplicationController
  def show
   @user = User.find_by_id(params[:id])
   @comentarios = User.find_by_id(params[:id]).comentarios
   #Tambien puedo usar current_user que provee devise
   #@user = current_user
  end





end
