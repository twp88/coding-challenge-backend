require 'rails_helper'

RSpec.describe Armory, type: :model do
  let!(:armory) { build(:armory, weapon_id: weapon.id, zombie_id: zombie.id)}

  let(:weapon) { create(:weapon, id: 1) }
  let(:zombie) { create(:zombie) }

  context 'when saving armory' do
    it 'returns true' do
      expect(armory.save).to eq(true)
    end
  end
end
