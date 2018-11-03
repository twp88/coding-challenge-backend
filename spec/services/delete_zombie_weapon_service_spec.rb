require 'rails_helper'

RSpec.describe DeleteZombieWeaponService do
  subject { DeleteZombieWeaponService.new(zombie.id, weapon.name) }

  let!(:zombie) { create(:zombie) }
  let!(:weapon) { create(:weapon, name: 'Knife') }

  let!(:armory) do
    create(:armory,
           zombie_id: zombie.id,
           weapon_id: weapon.id)
  end

  context 'when called' do
    it 'deletes zombie weapon' do
      expect { subject.call }.to change(Armory, :count).by(-1)
    end
  end
end
