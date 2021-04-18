Rails.application.routes.draw do
  get 'translater', to: 'translater#index'
  resources :uploads
  resources :blogs
  resources :translates
  post 'je', to: 'je#read'
  resources :todos
  get 'todo/index'
  resources :youtubes
  get 'search_stock', to: 'stock#search'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#controll'
  post 'done', to: 'images#done'
  post 'done_youtube', to: 'youtubes#done'
  get 'done_todo', to: 'todos#done'
  get 'imagesnew', to: 'images#new'
  get 'proc', to: 'uploads#proccc'
  post 'donetwo', to: 'images#donetwo'
  resources :comments
  resources :apocas
  resources :images   
  root 'blogs#index'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#logout'
  get 'admin', to: 'users#admin'
  resources :users, except: [:new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
