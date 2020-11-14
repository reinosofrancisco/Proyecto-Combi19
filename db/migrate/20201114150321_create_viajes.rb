class CreateViajes < ActiveRecord::Migration[6.0]
  def change
    create_table :viajes do |t|
      t.string :nombre
      t.date :fecha
      t.float :duracion
      t.integer :ruta_id
      t.integer :chofer_id
      t.integer :combi_id
      t.timestamps
    end
  end
end
