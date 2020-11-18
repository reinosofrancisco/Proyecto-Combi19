class AddDniToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dni, :string
  end
end
