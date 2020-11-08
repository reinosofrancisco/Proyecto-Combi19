Rails.application.routes.draw do
  devise_for :admins
  devise_for :chofers
  devise_for :users



  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #Cambia la ruta por defecto a la ruta de "Log_IN" de la gema Devise
  devise_scope :user do

    #Cambia esto a algo que no sea ADMIN porque... ya sabes
    authenticated :user do
      root 'pages#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new'
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
