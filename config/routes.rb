Rails.application.routes.draw do
  
  root 'users#index'

    resources :users
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

    resources :songs
  
  # Create a better looking URL for logging in
  get '/login', to: 'sessions#new'
  get 'users/new', to: 'users#new'
  post 'users', to: 'user#create'
  
  root to: 'songs#index'

    get 'songs', to: 'songs#index'
    get 'songs/new', to: 'songs#new'
    post 'songs', to: 'songs#create'
    get 'songs/:id', to: 'songs#show', as: :song
    delete 'songs/:id', to: 'songs#destroy'
    # get 'songs/:id/edit', to: 'songs#edit', as: song_edit
    # patch 'songs/:id', to 'songs#update'


end
