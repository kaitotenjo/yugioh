Rails.application.routes.draw do
  
  root "home#index"
  post '/product', to: 'product#index'
  get 'product/:id', to: 'product#show', as: :product_show
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users ,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  resources :homes
  resources :product
  resources :users
end
