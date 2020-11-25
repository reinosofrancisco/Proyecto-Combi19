class Provincia < ApplicationRecord
  validates :nombre, presence: true, uniqueness: true;
  def destroy

      if !(Ciudad.where(provincia_id: id).empty?)
        errors[:nombre] << "Ciudad no puede eliminarse"
        return false
      else
        super
      end
    end

end
