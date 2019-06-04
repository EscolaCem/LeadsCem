Rails.application.routes.draw do
  resources :sources
  get 'dashboard/index'
  resources :responsibles
  resources :responsives
  get 'lead/index'
  get 'partials/index'
  resources :companies
  root :to => 'pages#main'
    # /spendings_export
  get '/ticket_export' => 'tickets#export'
  get '/lead' => 'home#lead'
  resource :password, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  devise_for :users
  resources :tickets do
    resources :activities
  end
  resources :clients
  resources :users
  resources :courses

end
