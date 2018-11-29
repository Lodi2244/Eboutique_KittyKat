Rails.application.routes.draw do
  resources :charges, only: [:create, :new]
  resources :items, only: [:index, :show, :add_to_cart]
  resources :users, only: [:create, :show, :new]
  get 'cart', to: 'carts#show'
  get 'add_to_cart', to: 'items#add_to_cart'
  devise_for :users
  root to: 'items#index'
  root "items#index"
  get '/show', to: 'carts#show'
  post '/', to: 'items#add_to_cart'
end
