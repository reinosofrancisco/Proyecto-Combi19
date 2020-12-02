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
  config.model 'Adicional' do
    object_label_method do
      :nombre
    end
    configure :updated_at do
        hide
      end
      configure :created_at do
          hide
        end
  end

  config.model 'Viaje' do
    object_label_method do
      :nombre
    end
    configure :updated_at do
        hide
      end
      configure :created_at do
          hide
        end
        edit do
          exclude_fields :users , :asientos_restantes, :comentarios
        end
        create do
          exclude_fields :users , :asientos_restantes
        end
  end
  config.model 'Ciudad' do
    object_label_method do
       :nombre
    end
    create do
      field :nombre #para que solo me pida ingresar nombre
      field :provincia
    end
    edit do
      exclude_fields :rutas
    end
    configure :updated_at do
        hide
      end
      configure :created_at do
          hide
        end
        list do
          field :nombre do

          end
          field :provincia do

          end

          field :rutas do
            pretty_value do
             v = bindings[:view]
             id= (bindings[:object].id).to_s
             url= '/ver_rutas/'+id
             v.link_to "Ver rutas", url
           end
         end
        end

  end

  config.model 'Chofer' do
    object_label_method do
      :dni
    end
  #  Chofer.class_eval do
  #  def custom_label_method
  #    "#{self.nombre} (#{self.dni})"
  #  end
  #end
  end

  config.model 'Ruta' do
    object_label_method do
      :nombre
    end
    configure :updated_at do
        hide
      end
      configure :created_at do
          hide
        end
  end
  config.model 'Provincia' do
    object_label_method do
      :nombre
    end
    configure :updated_at do
        hide
      end
      configure :created_at do
          hide
        end
  end

  config.model 'Combi' do
    object_label_method do
      :patente
    end
    configure :updated_at do
        hide
      end
      configure :created_at do
          hide
        end
  end

  config.model 'Adicional' do
    object_label_method do
      :nombre
    end
  end


  config.model 'User' do
    configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
          hide
        end
        configure :updated_at do
            hide
          end
          configure :created_at do
              hide
            end
            configure :viajes do
                hide
              end
              configure :comentarios do
                  hide
                end
    create do
      exclude_fields :reset_password_sent_at,:remember_created_at,:viajes , :comentarios#para que solo me pida ingresar nombre
    end
    edit do
      exclude_fields :viajes,  :comentarios
    end
  end

  config.model 'Chofer' do
    configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
          hide
        end
        configure :updated_at do
            hide
          end
          configure :created_at do
              hide
            end
    create do
      exclude_fields :reset_password_sent_at,:remember_created_at #para que solo me pida ingresar nombre

    end
  end
  config.model 'Admin' do
    configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
          hide
        end
        configure :updated_at do
            hide
          end
          configure :created_at do
              hide
            end
    create do
      exclude_fields :reset_password_sent_at,:remember_created_at #para que solo me pida ingresar nombre

    end
  end

end
