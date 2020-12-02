class PagarViajeController < ApplicationController
  def main




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


end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd',
  })

  #DEFINIR COMPORTAMIENTO PARA CUANDO EL PAGO ES REALIZADO CON EXITO.
  #EN ESTE CASO, DISMINUIR UN ASIENTO DISPONIBLE PARA EL VIAJE
  #Y EVITAR QUE EL USUARIO EN PARTICULAR PUEDA COMPRAR DENUEVO EL PASAJE
  if charge["paid"] == true

  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path


    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    #DEFINIR COMPORTAMIENTO PARA CUANDO EL PAGO ES REALIZADO CON EXITO.
    #EN ESTE CASO, DISMINUIR UN ASIENTO DISPONIBLE PARA EL VIAJE
    #Y EVITAR QUE EL USUARIO EN PARTICULAR PUEDA COMPRAR DENUEVO EL PASAJE
    if charge["paid"] == true
      #COMPORTAMIENTO
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path



    end





<<<<<<< HEAD
=======

>>>>>>> 19b6977b7237d9050f47090cdbd4d5e56262289b
end
