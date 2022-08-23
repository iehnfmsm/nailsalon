Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "reservations#index"

  resources :reservations, only: [:new, :create, :destroy]

  resources :users, only: [:show]
end
