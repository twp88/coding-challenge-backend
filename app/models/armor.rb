class Armor < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :wardrobes
  has_many :zombies, through: :wardrobes
end

Armor.import
