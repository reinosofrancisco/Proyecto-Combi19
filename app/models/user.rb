class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :dni, presence: true, uniqueness: true
  validates :fecha_nacimiento , presence: true
  validate :mayor_18

  #Valida que el usuario a crear sea mayor de 18 años
  protected
    def mayor_18
  end
end
