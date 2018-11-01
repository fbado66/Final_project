Rails.application.routes.draw do


  post '/profiles/index', to: 'profiles#index' 
#  root to: 'profiles#new'
 
  devise_for :users
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :posts
resources :comments
resources :profiles
resources :post_comments
resources :characters
resources :user_posts
resources :videos


devise_scope :user do
  authenticated :user do
    root 'profiles#name', as: :authenticated_root
  end
  
  unauthenticated do
    root 'profiles#new', as: :unauthenticated_root
  end
end

end