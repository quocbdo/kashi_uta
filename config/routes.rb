Rails.application.routes.draw do
  
  root to: 'pages#show', page: 'home'
  # get '/pages/:page', to: 'pages#show'

  resources :songs

  get '/artists', to: 'songs#artists'

  # we only want to display a sign up page and create users
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  # Create a better looking URL for logging in
  get '/login', to: 'sessions#new'
  
end
