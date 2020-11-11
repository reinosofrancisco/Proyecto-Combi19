class CreateRuta < ActiveRecord::Migration[6.0]
  def change
    create_table :ruta do |t|
      t.string :origen
      t.string :destino
      t.string :aditional_id

      t.timestamps
    end
  end
end
