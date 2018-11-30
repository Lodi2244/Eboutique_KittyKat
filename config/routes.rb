Rails.application.routes.draw do

  resources :charges, only: [:create, :new]
  resources :items, only: [:index, :show]
  resource :cart, only: [:show]
  resources :items, only: [:index, :show,]
  resources :users, only: [:sign_up, :sign_in, :edit]
  devise_for :users
  get 'cart', to: 'carts#show'
  get 'add_to_cart', to: 'items#add_to_cart'
  get 'cart', to: 'carts#show'
  root to: 'items#index'


end
