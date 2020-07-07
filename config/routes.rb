Rails.application.routes.draw do
  resources :attendances
  resources :home, only: ["index"]
  root 'home#index'

  resources :users
  resources :events
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end
