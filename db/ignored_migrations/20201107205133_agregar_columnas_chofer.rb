class AgregarColumnasChofer < ActiveRecord::Migration[6.0]
  def change
    add_column :chofers, :nombre, :string
    add_column :chofers, :apellido, :string
    add_column :chofers, :dni, :string
    add_column :chofers, :telefono, :string
  end
end
