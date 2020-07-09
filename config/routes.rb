Rails.application.routes.draw do
  resources :home, only: ["index"]
  root 'events#index'

  resources :attendances, only: [:new, :create, :destroy]

  resources :users
  resources :events
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
