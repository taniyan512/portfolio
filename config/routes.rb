Rails.application.routes.draw do
  get 'services/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/' => 'home#top'
  get 'home/profile' => 'home#profile', as: :profile_home
  post 'home/profile' => 'home#update', as: :update_home
  get 'services/new' => 'services#new', as: :new_services
end
