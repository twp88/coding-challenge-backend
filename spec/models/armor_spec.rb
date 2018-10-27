require 'rails_helper'

RSpec.describe Armor, type: :model do
  let(:shield) { build(:armor) }

  context 'when saving standard armor' do
    it 'returns true' do
      expect(shield.save).to eq(true)
    end
  end

  context 'relations tests' do
    let(:shield) { create(:armor, id: 1) }
    let(:other_shield) { create(:armor, id: 2) }
    let(:other_zombie) { create(:zombie, id: 2) }
    let(:wardrobe) { create(:wardrobe, zombie_id: zombie_id, armor_id: shield.id) }
    let(:zombie) { create(:zombie, id: 1) }

    it 'returns the correct armor' do
      expect(zombie.armors.first.name).to eq(shield.name)
    end
  end
end
