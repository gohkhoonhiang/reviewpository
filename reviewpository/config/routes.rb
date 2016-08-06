Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#search'

  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'items/query', to: 'items#query'
  get 'account/settings', to: 'users#edit'
  patch 'account/settings', to: 'users#update'
  get 'items/listing', to: 'items#index'
  get 'user/items', to: 'items#user_items'
  get 'items/reset', to: 'items#reset'
  post 'like/review/:id', to: 'reviews#like', as: :like_review
  post 'dislike/review/:id', to: 'reviews#dislike', as: :dislike_review
  post 'like/comment/:id', to: 'comments#like', as: :like_comment
  post 'dislike/comment/:id', to: 'comments#dislike', as: :dislike_comment

  resources :users, except: [:edit, :new, :create, :update]
  resources :items, except: [:index]
  resources :reviews
  resources :comments
end
