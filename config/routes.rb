Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, :attractions
  get '/users/new', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'
  post '/rides', to: 'rides#create'
end
