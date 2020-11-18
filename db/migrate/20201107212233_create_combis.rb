class CreateCombis < ActiveRecord::Migration[6.0]
  def change
    create_table :combis do |t|
      t.string :patente
      t.string :cantidad_de_asientos

      t.timestamps
    end
  end
end
