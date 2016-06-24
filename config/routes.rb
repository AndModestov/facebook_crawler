Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :groups, only: [:index, :show, :new, :create, :destroy]

  root to: "groups#index"
end
