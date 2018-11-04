class Weapon < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :armories
  has_many :zombies, through: :armories
end

# Weapon.import
