class Provincia < ApplicationRecord
  validates :nombre, presence: true, uniqueness: true;
end
