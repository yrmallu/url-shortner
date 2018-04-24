Rails.application.routes.draw do
  root 'landings#index'

  # Authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :admin, path: 'admin',
                     as: 'admin',
                     only: [:index, :destroy]

  resources :users, path: 'profile',
                    as: 'profile',
                    param: :username,
                    only: [:edit, :update]

  # Public routes
  get '/:url_id', to: 'url#redirect_user', as: 'redirect'
  get '/s/:url_id', to: 'url#show', as: 'settings'
  post '/', to: 'url#generate', as: 'generate'
end
