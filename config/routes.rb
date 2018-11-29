Rails.application.routes.draw do
  resources :charges, only: [:create, :new]
  resources :items, only: [:index, :show]
  resources :users, only: [:create, :show, :new]
  get 'cart', to: 'product#show'
  get 'add_to_cart', to: 'items#add_to_cart'
  devise_for :users
<<<<<<< HEAD
  root to: 'items#index'
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  get '/show', to: 'carts#show'
>>>>>>> show_panier
end
