Rails.application.routes.draw do
  # get 'password_resets/new'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace ActiveAdmin.application.default_namespace do
  get 'searchable_tags'
  end

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories
  resources :categories do
    resources :sub_categories
  end
  resources :sub_categories do
    resources :products
  end
  resources :categories do
    resources :rent_sub_categories do
      resources :rent_products
    end
  end
  resources :brands
  resources :brands do
    resources :products
  end
  get "/products/product_type", to: "products#product_show"
  get "/rent_products/product_type/:product_type", to: "rent_products#product_show"
  get "/rent_products/:id", to: "rent_products#show"

  # get "/rent_products", to: "rent_products#index"
  # get "/rent_products/:id", to: "rent_products#show"

  get "/products", to: "products#index"
  get "/products/:id", to: "products#show"

  resources :users, param: :username
  post '/auth/login', to: 'authentication#login'
  

  # get '/*a', to: 'application#not_found'

  resources :password_resets



  post '/wishlists/add_product', to: 'wishlists#add_product'
  delete '/wishlists/remove_product', to: 'wishlists#remove_product'
  get '/wishlists', to:'wishlists#show'
  post '/wishlists/add_rent_product', to: 'wishlists#add_rent_product'
  delete '/wishlists/remove_rent_product', to: 'wishlists#remove_rent_product'

  # resources :wishlists

  post '/carts/add_product', to: 'carts#add_product'
  delete '/carts/remove_product', to: 'carts#remove_product'
  get '/carts', to:'carts#show'
  post '/carts/add_rent_product', to: 'carts#add_rent_product'
  delete '/carts/remove_rent_product', to: 'carts#remove_rent_product'


  #order
  post '/carts/place_order', to: 'orders#place_order'
  delete '/carts/cancel_order/:id', to: 'orders#cancel_order'
  resources :orders


  #shipping_address
  # post '/users/:user_id/address', to: 'addresses#create_address'
   
  resources :addresses
  resources :sales


end
