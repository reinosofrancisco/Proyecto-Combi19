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
      f=Date.today()
      if ((fecha_nacimiento) > (f - 18.year))
        errors[:fecha_nacimiento] << 'No se puede acceder al sitio siendo menor de 18 años'
    end
  end
end
