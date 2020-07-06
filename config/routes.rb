Rails.application.routes.draw do
  resources :users
  resources :events
  # devise_for :users, :controllers => { registrations: 'registrations' }

  resources :home, only: ["index"]
  root to: "home#index"
end
