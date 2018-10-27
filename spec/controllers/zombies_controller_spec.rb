require 'rails_helper'

RSpec.describe ZombiesController, type: :controller do
  let!(:first_zombie) { create(:zombie) }
  let!(:second_zombie) { create(:zombie) }

  describe '#index' do
    subject { get :index }

    it { is_expected.to be_successful }

    it 'returns correct json' do
      get :index

      expect(response.body).to eq([first_zombie, second_zombie].to_json)
    end
  end

  describe '#show' do
    subject { get :show, params: { id: first_zombie.id } }

    it { is_expected.to be_successful }

    it 'returns correct json' do
      get :show, params: { id: first_zombie.id }

      expect(response.body).to eq([first_zombie].to_json)
    end
  end
end
