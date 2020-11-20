module RailsAdmin
    module Config
      module Actions
        class Delete < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)

          register_instance_option :member do
            true
          end

          register_instance_option :route_fragment do
            'delete'
          end

          register_instance_option :http_methods do
            [:get, :delete]
          end

          register_instance_option :authorization_key do
            :destroy
          end

          register_instance_option :controller do
            proc do
              if request.get? # DELETE

                respond_to do |format|
                  format.html { render @action.template_name }
                  format.js   { render @action.template_name, layout: false }
                end

              elsif request.delete? # DESTROY

                redirect_path = nil
                @auditing_adapter && @auditing_adapter.delete_object(@object, @abstract_model, _current_user)
                if @object.destroy
                  flash[:success] = t('admin.flash.successful', name: @model_config.label, action: t('admin.actions.delete.done'))
                  redirect_path = index_path
                else
                    if @object.class.base_class.name=="Chofer"
                        flash[:error] = t("admin.flash.modelo_con_viajes", :name => @model_config.label)
                        redirect_path = back_or_index
                    elsif @object.class.base_class.name=="Ciudad"
                        flash[:error] = t("admin.flash.modelo_con_rutas", :name => @model_config.label)
                        redirect_path = back_or_index
                      elsif @object.class.base_class.name=="Ruta"
                          flash[:error] = t("admin.flash.modelo_con_viajes", :name => @model_config.label)
                          redirect_path = back_or_index
                        elsif @object.class.base_class.name=="Combi"
                            flash[:error] = t("admin.flash.modelo_con_viajes", :name => @model_config.label)
                            redirect_path = back_or_index
                    else
                        flash[:error] = t('admin.flash.error', name: @model_config.label, action: t('admin.actions.delete.done'))
                        redirect_path = back_or_index
                    end

                end

                redirect_to redirect_path

              end
            end
          end

          register_instance_option :link_icon do
            'icon-remove'
          end
        end
      end
    end
  end
