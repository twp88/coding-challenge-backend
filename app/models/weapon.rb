class Weapon < ApplicationRecord
  has_many :armories
  has_many :zombies, through: :armories
end
