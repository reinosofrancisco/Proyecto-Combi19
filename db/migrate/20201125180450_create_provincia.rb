class CreateProvincia < ActiveRecord::Migration[6.0]
  def change
    create_table :provincia do |t|
      t.string :nombre
      t.timestamps
    end
  end
end
