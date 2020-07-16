Rails.application.routes.draw do
  devise_for :users
  root   'products#index'
  resources :products do
    resources :reservations
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:index]
  resources :users, only: [:show] do
    member do
      get :reviews
    end
  end
end