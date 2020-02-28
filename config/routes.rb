Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  resources :categories

  get '/profiles/:id' => 'profiles#show', as: 'profile'
  get '/profiles/posts/:id' => 'profiles#selected_user_posts', as: 'selected_user_posts'
end
