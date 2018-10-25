class Armory < ApplicationRecord
  belongs_to :zombie
  belongs_to :weapon
end
