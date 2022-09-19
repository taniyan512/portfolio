Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/' => 'home#top'
  get 'home/profile' => 'home#profile', as: :profile_home
  post 'home/profile' => 'home#update', as: :update_home
end
