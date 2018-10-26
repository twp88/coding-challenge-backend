require 'rails_helper'

RSpec.describe Weapon, type: :model do
  let(:knife) { build(:weapon) }
  let(:shot_gun) { build(:shot_gun) }

  context 'when saving a standard weapon' do
    it 'returns true' do
      expect(knife.save).to eq(true)
    end
  end
end
