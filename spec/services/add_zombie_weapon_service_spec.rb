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
end
