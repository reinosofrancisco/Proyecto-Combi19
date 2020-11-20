Rails.application.routes.draw do
  devise_for :admins
  devise_for :chofers
  devise_for :users



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #Creo una ruta /sign_out para chofers y usuarios. Admin usa rails_admin, la cual ya tiene una forma de cerrar Sesion


  devise_scope :user do
    authenticated :user do
      root 'pages#ver_viajes', as: :user
    end
      get 'sign_out' => "devise/sessions#destroy"
  end
  devise_scope :chofers do
      get 'sign_out' => "devise/sessions#destroy"
  end


  #Cambia la ruta por defecto a la ruta especificada segun el device
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
