class AddFechaDesbaneoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fecha_desbaneo, :Date
  end
end
