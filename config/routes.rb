Rails.application.routes.draw do
  resources :charges, only: [:create, :new]
  resources :items, only: [:index, :show]
  resources :users
  get 'cart', to: 'product#show'
  get 'add_to_cart', to: 'items#add_to_cart'
  devise_for :users
  root to: 'items#index'
end
