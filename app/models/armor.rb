class Armor < ApplicationRecord
  has_many :wardrobes
  has_many :zombies, through: :wardrobes
end
