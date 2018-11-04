require 'rails_helper'

RSpec.describe Wardrobe, type: :model do
  let!(:wardrobe) { build(:wardrobe, armor_id: armor.id, zombie_id: zombie.id)}

  let(:armor) { create(:armor, id: 1) }
  let(:zombie) { create(:zombie) }

  context 'when saving armory' do
    it 'returns true' do
      expect(wardrobe.save).to eq(true)
    end
  end
end
