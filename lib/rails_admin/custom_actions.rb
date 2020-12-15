require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
    module Config
      module Actions
        class NewRecursively < RailsAdmin::Config::Actions::Base
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :collection do
                true
            end
    
            register_instance_option :http_methods do
                [:get, :post]
            end
    
            register_instance_option :controller do
                Proc.new do
                    if request.post?
                        @object=@abstract_model.new(params.require(@abstract_model.to_param)
                        .permit!)
                        flash[:notice] = "Creado #{@model_name} recursivamente"
                    elsif request.get?
                        @object=@abstract_model.new                        
                    end

                    # renders view otherwise
                end
            end
            register_instance_option :link_icon do
                'icon-asterisk'
            end
        end
      end
    end
  end