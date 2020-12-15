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
    #ASI NO BESTIABorro los pasajes del usuario
    #usuario_actual.pasajes = []

    fecha= Date.today
    viaje= Viaje.where((['fecha >= ? AND fecha < ?', fecha, fecha+100])).where(chofer_id:current_chofer).order(:fecha).first
    if(viaje != nil)
      pasaje= Pasaje.find_by_user_id(usuario_actual.id)
    end

    Pasaje.delete(pasaje.id)

    flash.alert = "El usuario no puede comprar viajes por las proximas 2 semanas"

  else
    #Si el usuario esta admitido, su fecha de desbaneo es hoy
    flash.alert = "Se completo la DDJJ con exito"
    usuario_actual.fecha_desbaneo = Date.today
    usuario_actual.save

  end

  redirect_to root_path










  end
end
