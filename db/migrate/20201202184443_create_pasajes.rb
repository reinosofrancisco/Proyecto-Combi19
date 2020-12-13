class CreatePasajes < ActiveRecord::Migration[6.0]
  def change
    create_table :pasajes do |t|

      t.belongs_to :viaje
      t.belongs_to :user
      t.string :estado
      t.timestamps
    end
  end
end
