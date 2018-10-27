class Armory < ApplicationRecord
  belongs_to :zombie, optional: true
  belongs_to :weapon
end
