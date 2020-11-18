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
      f=Date.today()
      if ((fecha_nacimiento) > (f - 18.year))
        errors[:fecha_nacimiento] << 'No se puede acceder al sitio siendo menor de 18 años'
    end
  end
=======
      f=Time.now()
      f_18= Date.new(18/0/0)
      if (fecha_nacimiento + f_18) < f
        errors[:fecha_nacimiento] << 'No se puede acceder al sitio siendo menor de 18 años'
    end
<<<<<<< HEAD
  end
=======
>>>>>>> b61453d48d40d8e42b49c7ae6bc42f5231f83c13
>>>>>>> 68add5df826dc81b6c89c1ce49f611c85d753c89
end
