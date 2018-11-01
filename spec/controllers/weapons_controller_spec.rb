require 'rails_helper'

RSpec.describe WeaponsController, type: :controller do
  let!(:knife) { create(:weapon, name: 'knife') }
  let!(:shotgun) { create(:weapon) }

  describe '#index' do
    subject { :index }

    it { is_expected.to be_successful }

    it 'returns correct json' do
      subject

      expect(response.body).to eq([knife, shotgun].to_json)
    end
  end
end
