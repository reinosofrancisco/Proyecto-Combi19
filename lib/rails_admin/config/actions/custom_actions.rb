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
                        hubo_errores=false
                        if @model_name=="Viaje"
                            #model_config.
                            if request.post?
                                if !params.nil?
                                    aux=params[:viaje]
                                    hasta=aux[:hasta_cuando]
                                    int=aux[:repeticion].to_i
                                    unit=aux[:unidad]
                                    if(hasta.nil? || hasta.to_date < aux[:fecha].to_date)

                                        #intentar crear el viaje
                                        @object=@abstract_model.new(params.require(@abstract_model.to_param)
                                        .permit(:nombre,
                                            :fecha,
                                            :hora_salida,
                                            :duracion,
                                            :ruta_id,
                                            :chofer_id,
                                            :combi_id,
                                            :precio))

                                        @object.fecha=aux[:fecha].to_date
                                        #se crea solo una entrada
                                        if !@object.save
                                            handle_save_error(:whereto => :new_recursively)
                                        end

                                    else
                                        byebug
                                        if !(int==0)
                                            if(!unit.empty?)
                                                fecha=aux[:fecha]
                                                schedule = IceCube::Schedule.new(fecha.to_date)
                                                if(unit=="d")
                                                    schedule.add_recurrence_rule IceCube::Rule.daily(int)
                                                elsif unit=="m"
                                                    schedule.add_recurrence_rule IceCube::Rule.monthly(int).day_of_month(fecha.to_date.day)
                                                elsif unit=="a"
                                                    schedule.add_recurrence_rule IceCube::Rule.yearly(int).day_of_year(fecha.to_date.yday)
                                                else
                                                    #WTF BRO
                                                end
                                                schedule.occurrences(hasta.to_date).each do |d|

                                                    #intentar crear el viaje
                                                    @object=@abstract_model.new(params.require(@abstract_model.to_param)
                                                                .permit(:nombre,
                                                                    :fecha,
                                                                    :hora_salida,
                                                                    :duracion,
                                                                    :ruta_id,
                                                                    :chofer_id,
                                                                    :combi_id,
                                                                    :precio))
                                                    @object.fecha=d

                                                    #si sale mal
                                                    if !@object.save
                                                        #customizar el error
                                                        flash.now[:error] = I18n.t('admin.flash.error', name: @model_config.label, action: I18n.t("admin.actions.#{@action.key}.done").html_safe).html_safe
                                                        flash.now[:error] += %(<br>- #{@object.errors.full_messages.join('<br>- ')}).html_safe

                                                        whereto= :new_recursively

                                                        respond_to do |format|
                                                            format.html { render whereto, status: :not_acceptable }
                                                            format.js   { render whereto, layout: false, status: :not_acceptable }
                                                        end
                                                        #redirect_to index
                                                        #handle_save_error #???
                                                        hubo_errores=true
                                                        break
                                                    end
                                                end




                                            else
                                                #error mal escrito repe
                                                flash.now[:error] = I18n.t('admin.flash.error', name: @model_config.label, action: I18n.t("admin.actions.#{@action.key}.done").html_safe).html_safe
                                                flash.now[:error] += %(<br>- No se ha ingresado una unidad).html_safe

                                                @object=@abstract_model.new
                                                whereto= :new_recursively
                                                respond_to do |format|
                                                    format.html { render whereto, status: :not_acceptable }
                                                    format.js   { render whereto, layout: false, status: :not_acceptable }
                                                end
                                                hubo_errores=true
                                            end
                                        else
                                            #nil en repe
                                            #error mal escrito repe
                                            flash.now[:error] = I18n.t('admin.flash.error', name: @model_config.label, action: I18n.t("admin.actions.#{@action.key}.done").html_safe).html_safe
                                            flash.now[:error] += %(<br>- Debe ingresar una cantidad en "cada cuanto").html_safe
                                            @object=@abstract_model.new

                                            whereto= :new_recursively
                                            respond_to do |format|
                                                format.html { render whereto, status: :not_acceptable }
                                                format.js   { render whereto, layout: false, status: :not_acceptable }
                                            end
                                            hubo_errores=true
                                        end
                                    end
                                end



                                #si llego acá todo piola

                                @object=@abstract_model.new #jaja
                                
                                flash[:notice] = "Creado #{@model_name}s recursivamente" if !hubo_errores
                                redirect_path = index_path if !hubo_errores
                            elsif request.get?
                                @object=@abstract_model.new
                            end
                        else
                            flash[:notice] = "¡NO DEBERÍA DE ESTAR VIENDO ESTO!"
                            redirect_to back_or_index
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