Rails.application.routes.draw do
  # get 'password_resets/new'
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
  resources :sub_categories do
    resources :rent_products
  end
  resources :brands
  resources :brands do
    resources :products
  end
  get "/rent_products", to: "rent_products#index"
  get "/rent_products/:id", to: "rent_products#show"

  get "/products", to: "products#index"
  get "/products/:id", to: "products#show"

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  resources :password_resets

end
