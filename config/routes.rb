Rails.application.routes.draw do
  devise_for :users
  root   'products#index'
  resources :products do
    resources :reservations
  end
  resources :users, only: [:show]
end