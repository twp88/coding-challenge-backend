Rails.application.routes.draw do
  resources :zombies
  resources :weapons, only: [:index]

  get 'search', to: 'search#search'
end
