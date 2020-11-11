class CreateCiudades < ActiveRecord::Migration[6.0]
  def change
    create_table :ciudades do |t|
      t.string :nombre
      t.belongs_to :ruta
      t.timestamps
    end
  end
end
