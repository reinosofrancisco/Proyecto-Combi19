class PagarViajeController < ApplicationController
  def main




  end



#VERIFICO QUE LA TARJETA CUMPLA DETERMINADAS CONDICIONES PARA SER VALIDA
  def create



    @numero = params[:tarjeta][:numero]
    @cvv = params[:tarjeta][:cvv]
    @fecha_vencimiento = params[:tarjeta][:fecha_vencimiento]


    @compra_exitosa = false

    if !(@numero.nil? || @cvv.nil? || @fecha_vencimiento.nil?)

      if @numero.length == 12

        if @cvv.length== 3

          if DateTime.parse(@fecha_vencimiento) > Date.today


            @compra_exitosa = true



          end

        end

      end

    end

  end




  def new

  arr=params[:adicional_id]
  #arr=["","1","2"...]
  arr = arr.delete_if { |x| x.empty? }
  total=0
  arr.each do |a|
    total= total + Adicional.find(a).precio
  end

  total=total+ Viaje.find_by_id(params[:viaje_id]).precio

  #Acá se calculó el total
  #podrías poner "render create" o alguna cosa así pa que se ejecute el método este create que habías hecho
  #o mover el código del create acá (mejor eso)


  #Aun no calcula adicionales
  @precio = total

  #Nose cuales adicionales selecciono el usuario. Por ende no los puedo sumar



  #POR AHORA HAGO QUE SE RESERVE AUTOMATICAMENTE
  pasaje= Pasaje.new
  arr.each do |a|
    pasaje.adicionales=pasaje.adicionales.append(Adicional.find_by_id(a))
  end
  pasaje.viaje_id=params[:viaje_id]
  pasaje.user_id=current_user.id
  pasaje.save
  if (Viaje.find_by_id(pasaje.viaje_id).asientos_restantes !=nil)
    Viaje.find_by_id(pasaje.viaje_id).asientos_restantes = (Viaje.find_by_id(pasaje.viaje_id).asientos_restantes) - 1
  end

end

end
