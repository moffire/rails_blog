Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  resources :categories

  get '/profiles/:id' => 'profiles#show', as: 'profile'
end
