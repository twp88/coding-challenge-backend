require 'rails_helper'

RSpec.describe SearchController, type: :controller, elasticsearch: true do
  let!(:zombie) { Zombie.create(name: Faker::HarryPotter.unique.character) }

  let(:response_name) do
    "[\"Zombie #{zombie.name}:\\n       Zombie id: #{zombie.id}"
  end

  describe '#search' do
    subject { get :search, params: { q: zombie.name } }

    it { is_expected.to be_successful }

    context 'when searching a name' do
      it 'returns correct zombie' do
        Zombie.__elasticsearch__.refresh_index!
        subject

        expect(response.body.split(',')[0]).to eq(response_name)
      end
    end
  end
end
