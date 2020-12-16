class DdjjController < ApplicationController
  def llenar
    @usuario= User.find_by_id(params[:user_id])
  end

  def new

    #VERIFICACION DE DATOS DEL FORMULARIO.
    #si contesta temperatura actual >= 37,5 más alguna otra entonces se rechaza
    #si contesta afirmativa cualquiera de las (!) más cualquier otra, entonces se rechaza
    arr = [
    params[:ddjj][:retorno_14_dias],
    params[:ddjj][:contacto_riesgoso],

    params[:ddjj][:sintomas_respiratorios],
    params[:ddjj][:fiebre],
    params[:ddjj][:dolor_garganta],

    params[:ddjj][:hipertenso],
    params[:ddjj][:enfermedades_respiratorias],
    params[:ddjj][:diabetico],
    params[:ddjj][:inmunodeprimida],
    params[:ddjj][:problemas_cardiacos],

    params[:ddjj][:hijos_menores],
    params[:ddjj][:convive_embarazada],
    params[:ddjj][:convive_fiebre],
  ]

  temperatura_actual = params[:ddjj][:temperatura_actual]

  banear_usuario = false;

  if temperatura_actual != nil then
    if temperatura_actual.to_f >= 37.5 then
        #Select me devuelve los valores que corroboran la condicion. Por lo tanto
        #Si el usuario tildo alguna casilla, lenght sera mayor a 0
        #y debera ser baneado por 2 semanas
        if ((arr.select { |number| number.to_i > 0 }).length != 0) then
          banear_usuario = true;
        end

    #Si el usuario tildo mas de una casilla, es baneado
  elsif ((arr.select { |number| number.to_i > 0 }).length > 1) then
      banear_usuario = true;
    end

  end

  usuario_actual = User.find(params[:user_id])

  if banear_usuario then

    usuario_actual.fecha_desbaneo = Date.today + 14.days
    usuario_actual.save

    #Si el usuario tiene pasajes, se los borro
    if (usuario_actual.pasajes != nil) then
      fecha= Date.today
      viaje= Viaje.where((['fecha >= ? AND fecha < ?', fecha, fecha+100])).where(chofer_id:current_chofer).order(:fecha).first
      if(viaje != nil)
        pasaje= Pasaje.find_by_user_id(usuario_actual.id)
        pasaje.estado = "DDJJ Rechazada"
        pasaje.save
      end
      #Pasaje.delete(pasaje.id)
    end

    flash.alert = "El usuario no puede comprar viajes por las proximas 2 semanas"

  else
    #Si el usuario esta admitido, su fecha de desbaneo es hoy
    flash.alert = "Se completo la DDJJ con exito"
    usuario_actual.fecha_desbaneo = Date.today - 1.days
    usuario_actual.save


  end



  redirect_to root_path



  end


  def registrar_usuario

    fecha= Date.today
    viaje = Viaje.where((['fecha >= ? AND fecha < ?', fecha, fecha+100])).where(chofer_id:current_chofer).order(:fecha).first

    if (viaje != nil) then
    usuario_actual = User.create(
      email: params[:usuario_nuevo][:email],
      password: "temp_pass_please_change",
      nombre: params[:usuario_nuevo][:nombre],
      apellido: params[:usuario_nuevo][:apellido],
      fecha_nacimiento: params[:usuario_nuevo][:fecha_nacimiento],
      telefono: params[:usuario_nuevo][:telefono],
      dni: params[:usuario_nuevo][:dni])

      if usuario_actual.save
          flash.alert = "Registrado con exito"
        else
            flash.alert = "Hubo un error en el registro"
          end


      pasaje_nuevo = Pasaje.create(
        user_id: usuario_actual.id,
        viaje_id: viaje.id)

    else
      flash.alert = "No tiene viajes, por lo que no puede registrar pasajeros"
    end
      redirect_to root_path

  end







end
