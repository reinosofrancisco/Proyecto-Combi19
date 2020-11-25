class CreateViajes < ActiveRecord::Migration[6.0]
  def change
    create_table :viajes do |t|
      t.string :nombre
      t.date :fecha
      t.time :hora_salida
      t.time :duracion
      t.integer :ruta_id
      t.integer :chofer_id
      t.integer :combi_id
      t.float :precio
      t.integer :asientos_restantes



      t.timestamps
    end
  end
end
