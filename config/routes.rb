Rails.application.routes.draw do


  # Scaffolded routes for the associated models
  resources :experiences
  resources :profiles
  resources :searches

  # Routes for conversations and messages model
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  get 'messages/index'
  get 'conversations/index'

  # Devise gem route for user
  devise_for :users

  # Route for root directory
  root 'home#index'

  # Routes for categories controller
  get '/categories', to: 'categories#index'
  get '/categories/boxing', to: 'categories#boxing'
  get '/categories/yoga', to: 'categories#yoga'
  get '/categories/cardio', to: 'categories#cardio'
  get '/categories/weights', to: 'categories#weights'

  # Route for all errors to redirect to
  get '/error', to: 'profiles#error'
 
end
