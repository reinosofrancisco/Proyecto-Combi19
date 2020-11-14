RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show



    #Si queremos que un modelo no aparezca en /admin
    #Blacklist de modelos(?
    #config.excluded_models << "ClassName"
    #config.excluded_models = ["Clase1","Clase2",...]
  end

  #Soy un crack kapo idolo mastodonte fiera

  config.model 'Ciudad' do
    object_label_method do
       :nombre
    end
    config.model 'Viaje' do
      object_label_method do
        :nombre
    end
  end

    create do
      field :nombre #para que solo me pida ingresar nombre
    end
  end

end
