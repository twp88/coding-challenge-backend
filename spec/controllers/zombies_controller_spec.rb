require 'rails_helper'

RSpec.describe ZombiesController, type: :controller do
  let!(:first_zombie) { create(:zombie) }
  let!(:second_zombie) { create(:zombie) }

  let(:fake_id) { 100_000 }
  let(:zombie_name) { Faker::HarryPotter.unique.character }
  let(:brains_eaten) { 5 }
  let(:hit_points) { 10 }
  let(:speed) { 7 }
  let(:turn_date) { Time.now }

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

      expect(response.body).to eq(first_zombie.to_json)
    end

    it 'returns correct response code' do
      get :show, params: { id: fake_id }

      expect(response.code).to eq('404')
    end
  end

  describe '#create' do
    subject { post :create, params: { name: zombie_name } }

    it { is_expected.to be_successful }

    it 'creates new zombie' do
      expect { post :create, params: { name: zombie_name } }
        .to change(Zombie, :count)
        .by(1)
    end
  end
end
