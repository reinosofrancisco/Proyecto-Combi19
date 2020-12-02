class CreateTarjeta < ActiveRecord::Migration[6.0]
  def change
    create_table :tarjeta do |t|
      t.integer :numero
      t.integer :cvv
      t.date :fecha_vencimiento

      t.timestamps
    end
  end
end
