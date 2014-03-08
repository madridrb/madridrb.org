Madridrb::Application.routes.draw do

  resource :session, only: [:new, :create]
  get :login, to: redirect('/session/new')

  resources :meetings, only: [:show]

  root 'meetings#index'
end
