require 'api_constraints'

Rails.application.routes.draw do

  # Squads and Members API
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version:1, default: true) do
      resources :squads do
        resources :members do
          member do
            get 'approve'
            get 'reject'
            get 'remove'
            get 'demote'
          end
        end
        member do
          get 'join'
        end
      end
    end
  end

  resources :squads
  root to: 'site#index'

  # Devise User Authentication
  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

end
