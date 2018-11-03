Rails.application.routes.draw do
  resources :zombies
  resources :weapons, only: [:index]

  get 'search', to: 'search#search'
  post 'add_zombie_weapon', to: 'zombies#add_weapon'
  delete 'delete_zombie_weapon', to: 'zombies#delete_weapon'
end
