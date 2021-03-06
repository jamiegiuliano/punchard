# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers:
                    { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :merchants do
    resources :links, only: %i[create edit update show destroy]
  end

  get '/current_favorite', to: 'merchants#favorite'

  authenticated :user do
    root to: 'merchants#index', as: :authenticated_root
  end

  root 'static#welcome'

  get '/about', to: 'static#about'
end
