Rails.application.routes.draw do
  devise_for :users
  root   'products#index'
  resources :products do
    resources :reservations
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:index]
  resources :ranking, only: [:index]
  resources :reservation_tables, only: [:index] do
    collection do
      get :search
    end
  end
  resources :contacts
  resources :users, only: [:show] do
    member do
      get :reviews
    end
  end
end