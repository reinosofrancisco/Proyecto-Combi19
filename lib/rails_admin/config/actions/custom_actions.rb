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
                        if @model_name="viaje"
                            #model_config.
                            if request.post?
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
                                                schedule.occurrences hasta.to_date do |d|
                                                    #intentar crear el viaje

                                                    
                                                end


                                                byebug
                                                
                                
                                
                                            else
                                                #error mal escrito repe
                                            end
                                        else
                                            #nil en repe
                                        end
                                    end
                                end
                                


                                
                                flash[:notice] = "Creado #{@model_name} recursivamente"
                                byebug
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
                    byebug
                    
    
    
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

