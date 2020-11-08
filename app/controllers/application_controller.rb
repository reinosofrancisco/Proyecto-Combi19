class ApplicationController < ActionController::Base
  #Por ahora no le pidas autenticar al usuario asi de una. A lo sumo hacelo
  #Si se quiere acceder al /admin
  #protect_from_forgery with: :exception
  #before_action :authenticate_admin!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:apellido])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:dni])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telefono])


  end

end
