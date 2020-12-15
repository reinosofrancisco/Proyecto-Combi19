Rails.application.routes.draw do
  devise_for :admins
  devise_for :chofers
  devise_for :users

  resources :comentarios

  resources :charges




  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


#RUTAS GENERICAS

    get 'ver_rutas/:id', to: 'ver_rutas#show',  as: "rutas"
    get 'ver_viajes', to: 'pages#ver_viajes', as: "viajes"
    get 'ver_viajes_chofer/:id', to: 'ver_viajes_choferes#ver_viajes', as:"viajes_choferes"

    get 'armado_pasaje/:viaje_id', to: 'armado_pasaje#main', as: "armado_pasaje"

    get 'armado_pasaje/pagar/:viaje_id', to: 'pagar_viaje#new', as: "pagar_viaje"


    post 'armado_pasaje/abonar/create/', to: 'pagar_viaje#create', as: "confirmar_Tarjeta"



    post 'cancelar_pasaje/user/:viaje_id', to: 'acciones_viaje#cancelar', as: "cancelar_viaje"

    post 'cancelar_pasaje/user/:user_id/:viaje_id', to: 'acciones_viaje#cancelar', as: "cancelar_viaje_choferes"

    get "armado_pasaje/pagar/:viaje_id/sign_out" => "devise/sessions#destroy"

    post 'completar_ddjj/:user_id',  to: 'ddjj#llenar' , as: "llenar_ddjj"
    post 'completar_ddjj/ddjj_controller/new',  to: 'ddjj#new' , as: "new_ddjj"



    get 'comentar_viaje/user/:viaje_id', to: 'acciones_viaje#comentar', as: "comentar_viaje"
    post 'comentar_viaje/user/:viaje_id', to: 'acciones_viaje#comentarPost', as: "comentar_viaje_post"

    delete 'borrar_comentario/user/:comentario_id', to: 'acciones_viaje#borrarComentario', as: "borrar_comentario"



#RUTAS PARA USUARIOS
  devise_scope :user do
    authenticated :user do
      root 'pages#ver_viajes', as: :user

      get 'user/:id', to: 'users#show', as: "user_info"
    end



      get 'sign_out' => "devise/sessions#destroy"

      get 'armado_pasaje/:viaje_id/sign_out' => "devise/sessions#destroy"
      get "armado_pasaje/pagar/sign_out" => "devise/sessions#destroy"



  end





#RUTAS PARA CHOFERES
  devise_scope :chofer do
      authenticated :chofer do
        root 'choferes_principal#ver_viaje', as: :chofer
        post 'cancelar_viaje/:pasaje_id', to: 'cancelar_viaje_chofer#cancelar', as: 'cancelar_choferes'
      end


      get 'sign_out' => "devise/sessions#destroy"
  end






#RUTAS PARA ADMINISTRADORES
  #Cambia la ruta por defecto a la ruta especificada segun el device
  devise_scope :admin do

    #Si sos administrador te manda a la pagina de /ADMIN
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
