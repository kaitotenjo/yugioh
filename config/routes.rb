Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "home#index"
  post '/product', to: 'product#index'
  get     "/login" , to: "sessions#new"
  post    "/login"  , to: "sessions#create"
  delete  "logout"  ,to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup",  to: "users#create"
  resources :homes
  resources :product
  resources :users
end
