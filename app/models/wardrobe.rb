class Wardrobe < ApplicationRecord
  belongs_to :zombie, optional: true
  belongs_to :armor
end
