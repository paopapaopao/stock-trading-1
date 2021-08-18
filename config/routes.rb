Rails.application.routes.draw do
  # match "/users", to: "users#index", via: "get"
  resources :transactions
  resources :roles
  devise_for :users
  resources :stocks
  resources :users
  root to: "stocks#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
