Rails.application.routes.draw do
  root to: "static#welcome"

  resources :links
  resources :merchants
  resources :users, only: [:show]

  # Login routes
  get '/login', to: 'session#new'
  post '/session', to: 'session#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
