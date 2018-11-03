require 'rails_helper'

RSpec.describe ParseZombieSearchResultsService do
  describe 'ParseZombieSearchResultsService' do
    subject { ParseZombieSearchResultsService.new([zombie]) }

    let(:zombie) { create(:zombie) }
    let(:shield) { create(:armor) }
    let(:weapon) { create(:weapon) }

    let(:desired_result) do
      "Zombie #{zombie.name}: #{zombie},
       Zombie weapons: #{zombie.weapons},
       Zombie armor: #{zombie.armors} ||"
    end

    let!(:armory) do
      create(:armory,
             weapon_id: weapon.id,
             zombie_id: zombie.id)
    end

    let!(:wardrobe) do
      create(:wardrobe,
             armor_id: shield.id,
             zombie_id: zombie.id)
    end

    context 'when called' do
      it 'returns correctly parsed results' do
        expect(subject.call).to eq(desired_result)
      end
    end
  end
end
