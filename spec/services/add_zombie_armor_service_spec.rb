require 'rails_helper'

RSpec.describe AddZombieArmorService do
  subject { AddZombieArmorService.new(zombie.id, armor.name) }

  let!(:zombie) { create(:zombie) }
  let!(:armor) { create(:armor, name: 'Shield') }

  context 'when called' do
    it 'adds armor to zombie' do
      expect { subject.call }.to change(Wardrobe, :count).by(1)
    end
  end

  context 'when called with the same armor' do
    let!(:wardrobe) do
      create(:wardrobe,
             zombie_id: zombie.id,
             armor_id: armor.id)
    end

    it 'does not add armor' do
      expect(subject.call).to eq("Zombie can't have the same armor twice!")
    end
  end
end
