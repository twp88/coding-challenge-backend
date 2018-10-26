class Zombie < ApplicationRecord
  before_save :set_defaults

  validates :name, presence: true

  def set_defaults
    self.hit_points = 10 if self.hit_points.nil?
    self.brains_eaten = 5 if self.brains_eaten.nil?
    self.speed = 15 if self.speed.nil?
  end
end
