Madridrb::Application.routes.draw do
  resources :meetings, only: [:show]

  root 'meetings#index'
end
