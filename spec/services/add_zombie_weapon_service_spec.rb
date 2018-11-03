require 'rails_helper'

RSpec.describe AddZombieWeaponService do
  subject { AddZombieWeaponService.new(zombie.id, weapon.name) }

  let!(:zombie) { create(:zombie) }
  let!(:weapon) { create(:weapon, name: 'Knife') }

  context 'when called' do
    it 'adds weapon to zombie' do
      expect { subject.call }.to change(Armory, :count).by(1)
    end
  end

  context 'when called with the same weapon' do
    let!(:armory) do
      create(:armory,
             zombie_id: zombie.id,
             weapon_id: weapon.id)
    end

    it 'does not add weapon' do
      expect(subject.call).to eq("Zombie can't have the same weapon twice!")
    end
  end
end
