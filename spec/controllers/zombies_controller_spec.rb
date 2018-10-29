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
  let(:new_name) { 'Ralf' }

  describe '#index' do
    subject { get :index }

    it { is_expected.to be_successful }

    it 'returns correct json' do
      subject

      expect(response.body).to eq([first_zombie, second_zombie].to_json)
    end
  end

  describe '#show' do
    subject { get :show, params: { id: first_zombie.id } }

    it { is_expected.to be_successful }

    it 'returns correct json' do
      subject

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
      expect { subject }.to change(Zombie, :count).by(1)
    end

    it 'rejects bad request' do
      post :create, params: { name: nil }

      expect(response.code).to eq('400')
    end
  end

  describe '#delete' do
    subject { delete :destroy, params: { id: first_zombie.id } }

    it { is_expected.to be_successful }

    it 'reduces zombies number' do
      expect { subject }.to change(Zombie, :count).by(-1)
    end
  end

  describe '#update' do
    subject { put :update, params: { id: first_zombie.id, name: new_name } }

    it { is_expected.to be_successful }

    it 'updates the correct zombie' do
      subject

      expect(Zombie.first.name).to eq(new_name)
    end
  end
end
