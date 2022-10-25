Rails.application.routes.draw do
  resources :users
  resources :tweets
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  resources :likes
  root 'tweets#index'
end
