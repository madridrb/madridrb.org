Madridrb::Application.routes.draw do
  resources :meetings, only: [:show]
end
