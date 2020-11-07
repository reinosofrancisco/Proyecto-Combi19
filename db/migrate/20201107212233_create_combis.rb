class CreateCombis < ActiveRecord::Migration[6.0]
  def change
    create_table :combis do |t|
      t.string :patente
      t.string :tipo
      t.boolean :en_viaje
      t.integer :nro_combi

      t.timestamps
    end
  end
end
