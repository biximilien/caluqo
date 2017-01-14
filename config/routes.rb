Rails.application.routes.draw do
  root 'root#index'

  get 'facebook/callback', to: 'root#facebook'
end
