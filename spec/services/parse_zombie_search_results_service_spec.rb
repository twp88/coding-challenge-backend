require 'rails_helper'

RSpec.describe ParseZombieSearchResultsService do
  describe 'ParseZombieSearchResultsService' do
    subject { ParseZombieSearchResultsService.new(zombies) }

    let(:zombie) { create(:zombie) }
    let(:shield) { create(:armor) }
    let(:weapon) { create(:weapon) }

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
        debugger
      end
    end
  end
end
