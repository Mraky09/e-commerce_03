Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/pages/*page", to: "static_pages#show"
  get "/cart", to: "cart#index"
  post "/cart/:id", to: "cart#create"
  delete "/cart/:id", to: "cart#destroy"

  namespace :admin do
    root "dashboard#show"
    resources :users
    resources :categories
    resources :products
    resources :orders
  end

  resources :products
  resources :users, except: [:destroy]
  resources :requests
  devise_for :users,
    :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
