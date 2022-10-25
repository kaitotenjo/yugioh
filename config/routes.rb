Rails.application.routes.draw do
  get 'product/index'
  root "home#index"
  resources :homes
end
