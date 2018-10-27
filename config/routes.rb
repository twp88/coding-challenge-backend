Rails.application.routes.draw do
  resources :zombies, only: [:index, :show]
end
