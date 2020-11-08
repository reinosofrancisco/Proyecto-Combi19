class ApplicationController < ActionController::Base
  #Por ahora no le pidas autenticar al usuario asi de una. A lo sumo hacelo
  #Si se quiere acceder al /admin
  #protect_from_forgery with: :exception
  #before_action :authenticate_user!
end
