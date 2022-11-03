Rails.application.routes.draw do
  
  root "home#index"
  post '/products/:card_id', to: 'products#index'
  post '/products/:card_id/:id', to: 'products#product_detail'
  get '/products/:card_id/:id', to: 'products#product_detail'
  post 'cart/add'
  post '/orderitems', to: 'orderitems#create'
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users , controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks" ,
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'u/:id', to: 'users#show', as:'user'  
  resources :homes
  resources :products
  resources :users
  resources :orderitems
end
