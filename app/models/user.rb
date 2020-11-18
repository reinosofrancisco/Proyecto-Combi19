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
<<<<<<< HEAD
      f=Time.now()
      f_18= Date.new(18/0/0)
      if (fecha_nacimiento + f_18) < f
        errors[:fecha_nacimiento] << 'No se puede acceder al sitio siendo menor de 18 años'
    end
=======
  end
>>>>>>> 59fb47556f6038bb66fb98f5453840a5df162a7a
end
