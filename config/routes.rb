Rails.application.routes.draw do

  get 'videos/index'
  get 'videos/show'
  get 'videos/edit'
  get 'videos/delete'
  get 'videos/create'
  get 'videos/update'
  get 'videos/new'
  get 'user_posts/index'
  get 'user_posts/show'
  get 'user_posts/edit'
  get 'user_posts/delete'
  get 'user_posts/create'
  get 'user_posts/update'
  get 'post_comments/index'
  get 'post_comments/create'
  get 'post_comments/new'
  get 'post_comments/update'
  get 'post_comments/delete'
  get 'profiles/index'
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/delete'
  get 'profiles/create'
  get 'profiles/update'
  get 'characters/index'
  get 'characters/show'
  get 'characters/edit'
  get 'characters/delete'
  get 'characters/create'
  get 'characters/update'
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'comments/delete'
  get 'comments/create'
  get 'comments/update'
  post '/profiles/index', to: 'profiles#index' 
  root to: 'profiles#new'

  devise_for :users
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/delete'
  get 'posts/create'
  get 'posts/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :posts
resources :comments
resources :profiles
resources :post_comments
resources :characters
resources :user_posts

end