Rails.application.routes.draw do

  resources :charges, only: [:create, :new]
<<<<<<< HEAD
  resources :items, only: [:index, :show]
  resource :cart, only: [:show]
=======
  resources :items, only: [:index, :show,]
  resources :users, only: [:create, :show, :new]
  devise_for :users
  get 'cart', to: 'carts#show'
>>>>>>> show_panier
  get 'add_to_cart', to: 'items#add_to_cart'
  get 'cart', to: 'carts#show'
  root to: 'items#index'


end
