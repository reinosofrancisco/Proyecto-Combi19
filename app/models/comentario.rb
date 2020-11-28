class Comentario < ApplicationRecord
  has_one :viaje
  has_one :user

end
