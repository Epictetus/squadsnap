Rails.application.routes.draw do

  root to: 'site#index'

  namespace :api do
    namespace :v1 do
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

  # Devise User Authentication
  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

end
