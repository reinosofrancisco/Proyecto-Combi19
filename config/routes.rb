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

  devise_scope :chofer do
      authenticated :chofer do
        root 'pages#ver_viajes', as: :chofer
      end

      get 'sign_out' => "devise/sessions#destroy"
  end

<<<<<<< HEAD
  get 'ver_rutas/:id', to: 'ver_rutas#show',  as: "rutas"
  get 'ver_viajes', to: 'pages#ver_viajes', as: "viajes"
=======
>>>>>>> 3497e18587f509f5ad945d2e1f3a4d7f49b6393b

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



      get 'ver_rutas/:id', to: 'ver_rutas#show',  as: "rutas"

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
