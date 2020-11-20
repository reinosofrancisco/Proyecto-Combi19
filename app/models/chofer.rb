class Chofer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :rememberable, :validatable
  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: true
  validates :apellido, presence: true
  validates :dni, presence: true, uniqueness: true
  default_scope -> {order(:apellido)}
  validate :dni_correcto
  def destroy

  if !Viaje.where(chofer:self).empty?
    errors[:nombre] << "Chofer no puede eliminarse"
    return false
  else
    super
  end
end
protected
def dni_correcto
  if(dni < 1000000)
    errors[:dni] << 'El dni ingresado no es un documento valido'
  end
end

end
