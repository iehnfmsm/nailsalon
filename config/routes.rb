Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "reservations#index"

  resources :reservations, only: [:new, :create, :destroy]
    namespace :admin do
      resources :reservations, only: [:index, :show]
    end

  resources :users, only: [:show]
    namespace :admin do
      resources :users, only: [:index, :destroy]
    end
end
