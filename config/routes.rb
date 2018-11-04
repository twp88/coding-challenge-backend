Rails.application.routes.draw do
  resources :zombies, only: [:index, :show, :new, :create, :update]
  resources :weapons, only: [:index]

  get 'search', to: 'search#search'
  post 'add_zombie_weapon', to: 'zombies#add_weapon'
  post 'add_zombie_armor', to: 'zombies#add_armor'
  delete 'delete_zombie_weapon', to: 'zombies#delete_weapon'
  delete 'delete_zombie_armor', to: 'zombies#delete_armor'
  delete 'delete_zombie', to: 'zombies#delete_zombie'
end
