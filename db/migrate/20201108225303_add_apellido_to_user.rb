class AddApellidoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :apellido, :string
  end
end
