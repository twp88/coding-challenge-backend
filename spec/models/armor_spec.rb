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
    let(:other_shield) { create(:armor, id: 2, name: 'other_shield') }
    let(:other_zombie) { create(:zombie, id: 2) }
    let(:zombie) { create(:zombie, id: 1) }

    let!(:wardrobe) do
      create(:wardrobe,
             zombie_id: zombie.id,
             armor_id: shield.id)
    end

    let!(:other_wardrobe) do
      create(:wardrobe,
             zombie_id: other_zombie.id,
             armor_id: other_shield.id)
    end

    it 'returns the correct armor' do
      expect(zombie.armors.first.name).to eq(shield.name)
    end

    it "doesn't return incorrect armor" do
      expect(zombie.armors.first.name).not_to eq(other_shield.name)
    end
  end
end
