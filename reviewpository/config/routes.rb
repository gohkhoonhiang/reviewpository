Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#search'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'items/query', to: 'items#query'
  get 'account/settings', to: 'users#edit'
  get 'items/listing', to: 'items#index'
  get 'user/items', to: 'items#user_items'
  get 'items/reset', to: 'items#reset'
  post 'like/review/:id', to: 'reviews#like', as: :like_review
  post 'dislike/review/:id', to: 'reviews#dislike', as: :dislike_review

  resources :users, except: [:edit, :new, :create]
  resources :items, except: [:index]
  resources :reviews
  resources :comments
end
