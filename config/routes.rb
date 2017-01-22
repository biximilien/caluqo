Rails.application.routes.draw do
  root 'events#index'

  resources :events, path: '/', only: [:index] do
    collection do
      get :list
    end
  end
end
