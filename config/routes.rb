Rails.application.routes.draw do
  devise_for :users
  root   'products#index'
  resources :products do
    resources :reservations
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:show]
end