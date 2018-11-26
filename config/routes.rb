Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to: "home#index", as: "home"
  get "/product/details/:id", to: "products#index", as: "product"
  get "/product/review/new", to: "reviews#index", as: "review"
  get "/product/new", to: "products#new", as: "product_new"
  post "/product/new", to: "products#create", as: "product_create"
  get "/transaction", to: "transactions#index", as: "transaction"
  post "/make", to: "transactions#make", as: "make_transaction"
  
  get "user/balance", to: "users#balance", as: "add_balance"
  get "user/username", to: "users#username", to: "users#username", as: "username"
  post "user/balance/add", to: "users#addbalance", as: "create_balance"
  post "user/username/update", to: "users#createusername", as: "update_username"
end
