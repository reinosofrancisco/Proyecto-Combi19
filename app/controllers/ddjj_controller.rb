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

  if temperatura_actual != nil then
    if temperatura_actual



  byebug





  end
end
