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
  let(:create_message) { "#{zombie_name} has been successfully spawned" }

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

    it 'returns correct json' do
      subject

      expect(response.body).to eq(create_message)
    end

    it 'rejects bad request' do
      post :create, params: { name: nil }
      skip
      expect(response.code).to eq('204')
    end
  end

  describe '#delete' do
    subject { delete :destroy, params: { id: first_zombie.id } }

    it { is_expected.to be_successful }

    it 'reduces zombies number' do
      expect { subject }.to change(Zombie, :count).by(-1)
    end

    it 'rejects bad request' do
      expect { delete :destroy, params: { id: nil } }
        .to raise_error(ActionController::UrlGenerationError)
    end
  end

  describe '#update' do
    subject { put :update, params: { id: first_zombie.id, name: new_name } }

    it { is_expected.to be_successful }

    it 'updates the correct zombie' do
      subject

      expect(Zombie.first.name).to eq(new_name)
    end

    it 'rejects bad request' do
      subject { put :update, params: { id: nil, name: new_name } }

      expect(response.code).to eq('204')
    end
  end

  describe '#add_weapon' do
    subject do
      post :add_weapon, params: { id: zombie.id, weapon_name: knife.name }
    end

    let!(:zombie) { create(:zombie) }
    let!(:knife) { create(:weapon, name: 'knife', id: 1) }

    it { is_expected.to be_successful }

    it 'adds a weapon to the zombie' do
      expect { subject }.to change(Armory, :count).by(1)
    end
  end

  describe '#delete_weapon' do
    subject do
      delete :add_weapon, params: { id: zombie.id, weapon_name: knife.name }
    end

    let!(:zombie) { create(:zombie) }
    let!(:knife) { create(:weapon, name: 'knife', id: 1) }
    let!(:armory) { create(:armory, zombie_id: zombie.id, weapon_id: knife.id) }

    it { is_expected.to be_successful }

    it 'deletes a weapon to the zombie' do
      expect { subject }.to change(Armory, :count).by(-1)
    end
  end

  describe '#add_weapon' do
    subject do
      post :add_armor, params: { id: zombie.id, armor_name: shield.name }
    end

    let!(:zombie) { create(:zombie) }
    let!(:shield) { create(:armor, name: 'shield', id: 1) }

    it { is_expected.to be_successful }

    it 'adds a weapon to the zombie' do
      expect { subject }.to change(Wardrobe, :count).by(1)
    end
  end

  describe '#delete_armor' do
    subject do
      delete :delete_armor, params: { id: zombie.id, armor_name: shield.name }
    end

    let!(:zombie) { create(:zombie) }
    let!(:shield) { create(:armor, name: 'shield', id: 1) }

    let!(:wardrobe) do
      create(:wardrobe,
             zombie_id: zombie.id,
             armor_id: shield.id)
    end

    it { is_expected.to be_successful }

    it 'deletes armor of the zombie' do
      expect { subject }.to change(Wardrobe, :count).by(-1)
    end
  end
end
