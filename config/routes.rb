Rails.application.routes.draw do
  root "home#index"
  post '/product', to: 'product#index'
  resources :homes
  resources :product
end
