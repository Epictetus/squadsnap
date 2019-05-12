Rails.application.routes.draw do

  root to: 'site#index'

  namespace :api do
      namespace :v1 do
        resources :squads, only: [:index, :create, :destroy,:update]
      end
    end

  resources :squads do
    resources :members do
      member do
        get 'approve'
        get 'reject'
        get 'remove'
      end
    end
    member do
      get 'join'
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

end
