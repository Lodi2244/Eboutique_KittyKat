Rails.application.routes.draw do
  resources :charges, only: [:create, :new]
  resources :items, only: [:index, :show]
  resource :cart, only: [:show]
  get 'add_to_cart', to: 'items#add_to_cart'
  devise_for :users
  root to: 'items#index'
  post '/log_out', to: 'users#log_out'
  
end
