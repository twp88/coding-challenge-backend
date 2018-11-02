require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { build(:person) }

  describe 'when saving human' do
    it 'returns true' do
      expect(person.save).to eq(true)
    end
  end
end
