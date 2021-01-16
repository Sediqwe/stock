Rails.application.routes.draw do
  resources :youtubes
  get 'search_stock', to: 'stock#search'
  get 'login', to: 'sessions#login'
  
  post 'login', to: 'sessions#controll'
  post 'done', to: 'images#done'
  post 'done_youtube', to: 'youtubes#done'
  resources :comments
  resources :apocas
  resources :images   
  root 'welcome#index'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#logout'
  get 'admin', to: 'users#admin'
  resources :users, except: [:new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
