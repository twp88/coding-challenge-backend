Rails.application.routes.draw do
  resources :zombies

  get 'search', to: 'search#search'
end
