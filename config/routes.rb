Rails.application.routes.draw do
  devise_for :users
  root to: "static#welcome"

  resources :users, only: [:new, :create, :show] do
    resources :merchants, only: [:new, :create]
  end

  # Login/Logout routes
  get '/login', to: 'session#new'
  post '/session', to: 'session#create'
  get '/logout', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
