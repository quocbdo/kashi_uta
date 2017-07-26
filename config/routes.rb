Rails.application.routes.draw do
  
  root to: 'users#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  resources :songs
  
end
