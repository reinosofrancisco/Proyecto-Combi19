class DdjjController < ApplicationController
  def llenar
    @usuario= User.find_by_id(params[:user_id])
  end
end
