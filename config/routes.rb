Rails.application.routes.draw do
  get 'home/search' => 'home#search', as: :search_home 
  get 'services/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/' => 'home#top'
  get 'home/profile' => 'home#profile', as: :profile_home
  post 'home/profile' => 'home#update', as: :update_home
  get 'home/:id' => 'home#show',as: :show_home
  
  resources :services
  post 'services' => 'services#create', as: :create_service

  resources :movies
  post 'movies' => 'movies#create', as: :create_movies
  post 'movies/:id' => 'movies#destroy', as: :destroy_movie
end
