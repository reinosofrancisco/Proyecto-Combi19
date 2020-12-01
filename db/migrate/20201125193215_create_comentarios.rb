class CreateComentarios < ActiveRecord::Migration[6.0]
  def change
    create_table :comentarios do |t|

      t.string :mensaje
      t.belongs_to :user
      t.belongs_to :viaje

      t.timestamps
    end
  end
end
