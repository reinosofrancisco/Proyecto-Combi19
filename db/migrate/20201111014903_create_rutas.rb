class CreateRutas < ActiveRecord::Migration[6.0]
  def change
    create_table :rutas do |t|
      t.string :origen
      t.string :destino

      t.timestamps
    end
  end
end
