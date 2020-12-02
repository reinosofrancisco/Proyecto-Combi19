class CreateViajeUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :viaje_usuarios do |t|

      t.belongs_to :user
      t.belongs_to :viaje


      t.timestamps
    end
  end
end