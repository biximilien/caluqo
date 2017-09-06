Rails.application.routes.draw do
  root 'events#index'

  get '/(:month)', to: 'events#index'


  # resources :events, path: '/', only: [:index, :show] do
  #   collection do
  #     get :embed
  #     get :list
  #   end
  # end
end
