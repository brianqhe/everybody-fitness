Rails.application.routes.draw do
  resources :experiences
  get 'messages/index'
  get 'conversations/index'
  resources :profiles
  resources :searches
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  devise_for :users
  root 'home#index'
  get '/about', to: 'home#about'
  get '/error', to: 'profiles#error'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
