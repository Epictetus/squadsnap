require 'api_constraints'

Rails.application.routes.draw do
  # GraphQL
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  # Squads and Members API
  namespace :api do
    # ApiConstaints is a lib file to allow default API versions,
    # this will help prevent having to change link names from /api/v1/squads to /api/squads, better maintainability
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
