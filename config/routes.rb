Rails.application.routes.draw do
  devise_for :admins
  devise_for :chofers
  devise_for :users



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #Cambia la ruta por defecto a la ruta de "Log_IN" de la gema Devise
  devise_scope :admin do

    #Si sos administrador te manda a la pagian de /ADMIN
    authenticated :admin do
      root 'rails_admin/main#dashboard', as: :authenticated_root
    end

    #Por ahora, caso contrario, te manda a la pagina principal
    unauthenticated do
      root 'pages#index'
    end

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
