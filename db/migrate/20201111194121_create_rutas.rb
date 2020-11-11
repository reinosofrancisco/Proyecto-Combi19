class CreateRutas < ActiveRecord::Migration[6.0]
  def change
    create_table :rutas do |t|
      t.string :nombre
      t.string :descripcion

      t.integer :origen_id
      t.integer :destino_id

      t.timestamps
    end
  end
end
