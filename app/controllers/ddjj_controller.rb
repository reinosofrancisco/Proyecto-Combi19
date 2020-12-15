class DdjjController < ApplicationController
  def llenar
    @usuario= User.find_by_id(params[:user_id])
  end

  def create
    byebug

  end
end
