class Zombie < ApplicationRecord
  before_save :set_defaults

  validates :name, presence: true

  has_many :armories
  has_many :weapons, through: :armories

  def set_defaults
    self.hit_points = 10 if hit_points.nil?
    self.brains_eaten = 5 if brains_eaten.nil?
    self.speed = 15 if speed.nil?
  end
end
