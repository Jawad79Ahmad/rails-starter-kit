# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '/auth', controllers: {
    sessions: 'auth/sessions',
    confirmations: 'auth/confirmations',
    passwords: 'auth/passwords',
    registrations: 'auth/registrations',
    unlocks: 'auth/unlocks'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'dashboard#index'

  scope :dashboard do
    get '/', to: 'dashboard#index', as: :dashboard
    get '/form', to: 'dashboard#form', as: :form
    get '/cards', to: 'dashboard#cards', as: :cards
    get '/charts', to: 'dashboard#charts', as: :charts
    get '/buttons', to: 'dashboard#buttons', as: :buttons
    get '/modals', to: 'dashboard#modals', as: :modals
    get '/tables', to: 'dashboard#tables', as: :tables
    resources :users, only: %i[index show edit update destroy]
  end
end
