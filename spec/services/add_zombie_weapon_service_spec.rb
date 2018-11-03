require 'rails_helper'

RSpec.describe AddZombieWeaponService do
  let!(:zombie) { create(:zombie) }
  let!(:weapon) { create(:weapon, name: 'Knife') }
  subject { AddZombieWeaponService.new(zombie.id, weapon.name) }

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

  context 'when called with too many weapons' do
    let!(:shotgun) { create(:weapon, name: 'Shotgun') }
    let!(:machete) { create(:weapon, name: 'Machete') }
    let!(:pistol) { create(:weapon, name: 'Pistol') }

    let!(:armory) do
      create(:armory,
             zombie_id: zombie.id,
             weapon_id: shotgun.id)
    end

    let!(:armory) do
      create(:armory,
             zombie_id: zombie.id,
             weapon_id: machete.id)
    end

    let!(:armory) do
      create(:armory,
             zombie_id: zombie.id,
             weapon_id: pistol.id)
    end

    it 'does not add weapon' do
      expect(subject.call).to eq("Zombie can only have a maximum four weapons")
    end
  end
end
