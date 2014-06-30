Madridrb::Application.routes.draw do

  namespace :users do
    resource :password, only: [:edit, :update]
  end

  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  resources :reset_passwords, only: [:new, :create, :edit, :update]
  resources :meetings, only: [:index, :show] do
    resources :comments, only: [:create, :destroy], module: :meetings
    resource :attendees, only: [:create, :destroy], module: :meetings
  end

  root 'meetings#index'
end
