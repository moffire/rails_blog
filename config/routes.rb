Rails.application.routes.draw do
  get 'profile' => 'users#show'
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  resources :categories
end
