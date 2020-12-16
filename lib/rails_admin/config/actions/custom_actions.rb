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
                                    repe=aux[:repeticion]
                                    hasta=aux[:hasta_cuando]
                                    if(hasta.nil? || hasta<aux[:fecha])
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
                                        if(!repe.nil?)
                                            repe.downcase!
                                            repe=repe.match(/((?<int>([\d]+)\s?)(?<unit>(d|m|a|$)))/)
                                            
                                            if(!(repe[:int].empty? || repe[:unit].empty?))
                                                int=repe[:int]
                                                unit=repe[:unit]
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
                                                flash.now[:error] += %(<br>- Formato de periodicidad no válido).html_safe

                                                whereto= :new_recursively
                                                respond_to do |format|
                                                    format.html { render whereto, status: :not_acceptable }
                                                    format.js   { render whereto, layout: false, status: :not_acceptable }
                                                end
                                                @object=@abstract_model.new
                                                
                                            end
                                        else
                                            #nil en repe
                                            #error mal escrito repe
                                            flash.now[:error] = I18n.t('admin.flash.error', name: @model_config.label, action: I18n.t("admin.actions.#{@action.key}.done").html_safe).html_safe
                                            flash.now[:error] += %(<br>- Debe ingresar periodicidad).html_safe
                                            
                                            whereto= :new_recursively
                                            respond_to do |format|
                                                format.html { render whereto, status: :not_acceptable }
                                                format.js   { render whereto, layout: false, status: :not_acceptable }
                                            end
                                            @object=@abstract_model.new
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


  
  
  def crear_recursivo

    if !params.nil?
        aux=params[:viaje]
        repe=aux[:repeticion]
        hasta=aux[:hasta_cuando]
        if(hasta.nil? || hasta<aux[:fecha])
            #se crea solo una entrada
        else
            if(!repe.nil?)
                repe.downcase!
                repe=repe.match(/((?<int>([\d]+)\s?)(?<unit>(d|m|a|$)))/)
                if(!(repe[:int].empty? || repe[:unit].empty?))
                    int=repe[:int]
                    unit=repe[:unit]
                    schedule = IceCube::Schedule.new
                    if(unit=="d")
                        schedule.add_recurrence_rule IceCube::Rule.daily(int)
                    elsif unit=="m"
                        schedule.add_recurrence_rule IceCube::Rule.monthly(int).day_of_month(fecha.to_date.day)
                    elsif unit=="a"
                        schedule.add_recurrence_rule IceCube::Rule.yearly(int).day_of_year(fecha.to_date.yday)
                    else
                        #WTF BRO
                    end
                    
                    
    
    
                else
                    #error mal escrito repe
                end
            else
                #nil en repe
            end
        end
    


        
        @object=@abstract_model.new(params.require(@abstract_model.to_param)
        .permit(:nombre,
            :fecha,
            :hora_salida,
            :duracion,
            :ruta,
            :chofer,
            :combi,
            :precio))

    else
        return false
    end
end

