Rails.application.routes.draw do
  root 'events#index'

  resources :events, path: '/'
end
