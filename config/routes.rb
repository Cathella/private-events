Rails.application.routes.draw do
  resources :events
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: ["index"]
  root to: "home#index"
end
