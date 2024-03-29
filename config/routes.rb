Rails.application.routes.draw do
  get 'save', to: 'save#index'
  post 'urlke', to: 'translater#urlke'
  get 'save_to', to: 'save#save'
  get 'save_to_csv', to: 'save#save_csv'
  get 'save_final', to: 'save#save_final'
  get 'select', to: 'translater#select'
  post 'download', to: 'save#download'
  post 'translate', to: 'translater#translate'
  post 'ok', to: 'translater#ok'
  post 'nok', to: 'translater#nok'
  post 'file_reset', to: 'uploads#file_reset'
  post 'torol', to: 'translater#toroldlegyszi'
  resources :projects
  get 'translater', to: 'translater#index'
  resources :uploads
  resources :blogs
  resources :translates
  post 'je', to: 'je#read'
  post 'api', to: 'kattanas#start'
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
  get 'imagesnewmulti', to: 'images#newmulti'
  get 'proc', to: 'uploads#proc'
  get 'proc_csv', to: 'uploads#proc_csv'
  post 'donetwo', to: 'images#donetwo'
  get 'kattanas', to: 'kattanas#start'
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
