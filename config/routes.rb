Rails.application.routes.draw do
  resources :songs
  resources :users
  resources :comments
  root to: 'home#index'
end
