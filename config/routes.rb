Madridrb::Application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :meetings, only: [:show]

  root 'meetings#index'
end
