Rails.application.routes.draw do
  resources :charges
  get 'charges/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
end
