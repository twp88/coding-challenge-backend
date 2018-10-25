require 'rails_helper'

RSpec.describe Zombie, type: :model do
  context 'validations tests' do
    let(:zombie) { build(:zombie) }
    it 'ensures the first name is present' do
      zombie.name = nil
      expect(zombie.save).to eq(false)
    end
  end
end
