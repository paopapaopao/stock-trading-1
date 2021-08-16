Rails.application.routes.draw do
  resources :transactions
  resources :roles
  devise_for :users
  resources :stocks
  root to: "stocks#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
