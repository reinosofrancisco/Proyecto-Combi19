class PagarViajeController < ApplicationController
    def main

      # arr=params[:adicional_id]
      # #arr=["","1","2"...]
      # arr = arr.delete_if { |x| x.empty? }
      # total=0
      # arr.each do |a|
      #   total= total + Adicional.find(a).precio
      # end
      #
      # total=total+ Viaje.find_by_id(params[:viaje_id]).precio

      #Acá se calculó el total
      #podrías poner "render create" o alguna cosa así pa que se ejecute el método este create que habías hecho
      #o mover el código del create acá (mejor eso)


    end


  def new

    #Aun no calcula adicionales
    @precio = Viaje.find_by_id(params[:viaje_id]).precio

    #Nose cuales adicionales selecciono el usuario. Por ende no los puedo sumar


  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    pagar_viaje = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    #DEFINIR COMPORTAMIENTO PARA CUANDO EL PAGO ES REALIZADO CON EXITO.
    #EN ESTE CASO, DISMINUIR UN ASIENTO DISPONIBLE PARA EL VIAJE
    #Y EVITAR QUE EL USUARIO EN PARTICULAR PUEDA COMPRAR DENUEVO EL PASAJE
    if pagar_viaje["paid"] == true
      #COMPORTAMIENTO


      ###
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path



    end




end
