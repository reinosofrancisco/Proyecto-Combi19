class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.bigint :dni
      t.date :fecha_nacimiento
      t.string :telefono
      
      t.timestamps
    end
  end
end
