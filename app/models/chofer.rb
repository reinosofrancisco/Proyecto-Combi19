class Chofer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true
  validates :apellido, presence: true
  validates :dni, presence: true, uniqueness: true
  default_scope -> {order(:apellido)}
end
