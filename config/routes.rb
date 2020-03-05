Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  resources :categories

  get '/profiles/friends_posts'
  get '/profiles/:id' => 'profiles#show', as: 'profile'
  get '/profiles/:id/posts' => 'profiles#selected_user_posts', as: 'selected_user_posts'
  get '/profiles/subscribe/:id' => 'profiles#subscribe', as: 'subscribe'
  get '/profiles/unsubscribe/:id' => 'profiles#unsubscribe', as: 'unsubscribe'
  get '/category/:id/posts' => 'categories#category_all_posts', as: 'category_all_posts'
end
