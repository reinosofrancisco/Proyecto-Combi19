class CreateCiudades < ActiveRecord::Migration[6.0]
  def change
    create_table :ciudades do |t|
      t.string :nombre
      t.integer :provincia_id;
      t.timestamps
    end
  end
end
