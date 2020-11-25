class AddRelationAdicionalRuta < ActiveRecord::Migration[6.0]
  def change



    #Could not find table 'aditionals_rutas'
    #crea la tabla de relacion rutas-adicionales. No les asigna id y para cada entrada


    # create_table :rutas_aditionals, id: false do |t|
    #   t.belongs_to :ruta #pertenece a una ruta (para que sea direccionable desde ahi)
    #   t.belongs_to :aditional # y tambien a un adicional
    # end

    create_table :adicionales_rutas, id: false do |t|
      t.belongs_to :ruta #pertenece a una ruta (para que sea direccionable desde ahi)
      t.belongs_to :adicional # y tambien a un adicional
    end

  end
end
