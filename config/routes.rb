Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [] do
    member do
      resources :merchants
      get '/current_favorite', to: 'merchants#favorite'
    end
  end

  authenticated :user do
    root to: 'merchants#index', as: :authenticated_root
  end

  root 'static#welcome'

  get '/about', to: 'static#about'

end
