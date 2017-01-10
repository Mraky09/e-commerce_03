Rails.application.routes.draw do
  root "static_pages#home"
  get "/pages/help", to: "static_pages#help"
  get "/pages/about", to: "static_pages#about"
  get "/pages/contact", to: "static_pages#contact"
  get "/pages/*page", to: "static_pages#show"

  namespace :admin do
    get "dashboard/show"
    resources :users
    resources :categories
    resources :products
  end

  devise_for :users
end
