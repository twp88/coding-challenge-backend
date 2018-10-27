require 'rails_helper'

RSpec.describe Zombie, type: :model do
  let(:brains_eaten) { 5 }
  let(:default_hit_points) { 10 }
  let(:default_brains_eaten) { 5 }
  let(:default_speed) { 15 }
  let(:hit_points) { 10 }
  let(:speed) { 7 }

  let(:zombie) do
    build(:zombie,
          hit_points: hit_points,
          brains_eaten: brains_eaten,
          speed: speed)
  end

  context 'validations tests' do
    it 'ensures the first name is present' do
      zombie.name = nil

      expect(zombie.save).to eq(false)
    end
  end

  context 'default value tests' do
    it 'ensures default value for hit_points' do
      zombie.hit_points = nil
      zombie.save

      expect(zombie.hit_points).to eq(default_hit_points)
    end

    it 'ensures default value for brains_eaten' do
      zombie.brains_eaten = nil
      zombie.save

      expect(zombie.brains_eaten).to eq(default_brains_eaten)
    end

    it 'ensures default value for speed' do
      zombie.speed = nil
      zombie.save

      expect(zombie.speed).to eq(default_speed)
    end

    it 'ensures non default value for speed' do
      zombie.save

      expect(zombie.hit_points).to eq(hit_points)
    end

    it 'ensures non default value for speed' do
      zombie.save

      expect(zombie.brains_eaten).to eq(brains_eaten)
    end

    it 'ensures non default value for speed' do
      zombie.save

      expect(zombie.speed).to eq(speed)
    end
  end

  context 'relations tests' do
    let!(:armory) { create(:armory, weapon_id: shot_gun.id, zombie_id: zombie.id) }
    let!(:shot_gun) { create(:weapon) }

    let(:zombie) { create(:zombie, id: 102) }

    it 'returns the zombies weapon' do
      expect(zombie.weapons.first.name).to eq('Shotgun')
    end
  end
end
