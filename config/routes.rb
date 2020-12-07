Rails.application.routes.draw do
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#controll'
  resources :comments
  resources :apocas, only: [:index, :show]
  resources :images   
  root 'welcome#index'
  get 'signup', to: 'users#new'
  get 'logout', to: 'users#destroy'
  resources :users, except: [:new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
