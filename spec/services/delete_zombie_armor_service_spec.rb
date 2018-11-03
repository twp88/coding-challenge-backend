require 'rails_helper'

RSpec.describe DeleteZombieArmorService do
  subject { DeleteZombieArmorService.new(zombie.id, armor.name) }

  let!(:zombie) { create(:zombie) }
  let!(:armor) { create(:armor, name: 'Shield') }

  let!(:wardrobe) do
    create(:wardrobe,
           zombie_id: zombie.id,
           armor_id: armor.id)
  end

  context 'when called' do
    it 'deletes zombie weapon' do
      expect { subject.call }.to change(Wardrobe, :count).by(-1)
    end
  end
end
