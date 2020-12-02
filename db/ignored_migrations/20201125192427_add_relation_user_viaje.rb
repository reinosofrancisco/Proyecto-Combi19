class AddRelationUserViaje < ActiveRecord::Migration[6.0]
  def change
    create_table :users_viajes, id: false do |t|
      t.belongs_to :user #pertenece a un user (para que sea direccionable desde ahi)
      t.belongs_to :viaje # y tambien a un viaje
    end
  end
end