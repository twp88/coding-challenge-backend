require 'rails_helper'

RSpec.describe ZombiesController, type: :controller do
  describe '#index' do
    subject { get :index }

    let!(:first_zombie) { create(:zombie) }
    let!(:second_zombie) { create(:zombie) }

    it { is_expected.to be_successful }

    it 'returns correct json' do
      get :index

      expect(response.body).to eq([first_zombie, second_zombie].to_json)
    end
  end
end
