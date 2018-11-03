require 'rails_helper'

RSpec.describe ParseZombieSearchResultsService do
  describe 'ParseZombieSearchResultsService' do
    subject { ParseZombieSearchResultsService.new([zombie]) }

    let(:zombie) { create(:zombie) }
    let(:armor) { create(:armor) }
    let(:weapon) { create(:weapon) }

    let(:desired_result) do
      ["Zombie #{zombie.name}:
       Zombie id: #{zombie.id},
       Zombie hit_points: #{zombie.hit_points},
       Zombie brains_eaten: #{zombie.brains_eaten},
       Zombie speed: #{zombie.speed},
       Zombie turn_date: #{zombie.turn_date},
       Zombie hungry?: #{zombie.hungry?},
       Zombie last_ate: #{zombie.last_ate},
       Zombie weapons:
        [Weapon name: #{weapon.name},
        Weapon attack_points: #{weapon.attack_points},
        Weapon durability: #{weapon.durability},
        Weapon price: #{weapon.price}],
       Zombie armor:
        [Armor name: #{armor.name},
        Armor defense_points: #{armor.defense_points},
        Armor durability: #{armor.durability},
        Armor price: #{armor.price}||"]
    end

    let!(:armory) do
      create(:armory,
             weapon_id: weapon.id,
             zombie_id: zombie.id)
    end

    let!(:wardrobe) do
      create(:wardrobe,
             armor_id: armor.id,
             zombie_id: zombie.id)
    end

    context 'when called' do
      it 'returns correctly parsed results' do
        expect(subject.call).to eq(desired_result)
      end
    end
  end
end
