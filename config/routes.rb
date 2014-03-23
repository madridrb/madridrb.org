Madridrb::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :reset_passwords, only: [:new, :create, :edit, :update]
  resources :meetings, only: [:show]

  root 'meetings#index'
end
