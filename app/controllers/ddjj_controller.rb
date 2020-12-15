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

  #EL USUARIO DEBE TENER UN CAMPO FECHA EL CUAL SERA LA FECHA EN LA CUAL
  #SERA DESBANEADO. SI LA FECHA ES MENOR QUE LA FECHA ACTUAL, EL USUARIO
  #ESTA DESBANEADO.
  #POR DEFECTO, AL CREAR UN USUARIO HABRIA QUE HACER QUE LA FECHA
  #DE DESBANEAR SEA LA FECHA ACTUAL

  #SI FECHA DESBANEO ES NIL, EL USUARIO NUNCA FUE BANEADO. DEJALO EN PAZ HACER SU VIDA

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

  if banear_usuario then
    usuario_actual = User.find(params[:user_id])
    usuario_actual.fecha_desbaneo = Date.today + 14.days
    usuario_actual.save

  end




  byebug





  end
end
