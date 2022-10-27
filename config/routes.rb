Rails.application.routes.draw do
  
  root "home#index"
  post '/product', to: 'product#index'
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users
  resources :homes
  resources :product
  resources :users
end
