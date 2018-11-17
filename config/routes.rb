Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to: "home#index", as: "home"
  get "/product/details/:id", to: "products#index", as: "product"
  get "/product/review/new", to: "reviews#index", as: "review"
  get "/product/new", to: "products#new", as: "product_new"
  get "/transaction", to: "transactions#index", as: "transaction"
  post "/make", to: "transactions#make", as: "make_transaction"
end
