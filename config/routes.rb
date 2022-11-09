Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories
  resources :categories do
    resources :sub_categories
  end
  resources :sub_categories do
    resources :products
  end
  resources :brands
  resources :brands do
    resources :products
  end
  get "/all_products", to: "products#index"
end
