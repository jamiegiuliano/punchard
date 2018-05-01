Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    member do
      resources :merchants, only: [:new, :create, :index, :show]
    end
  end

  authenticated :user do
    root to: 'merchants#index', as: :authenticated_root
  end

  root 'static#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
