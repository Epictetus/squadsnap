Rails.application.routes.draw do

  root to: 'site#index'
  #root to: 'pages#index'  # old index, prior to using React

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
      #put 'join'
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  #root to: 'pages#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :posts do
    collection do
      get 'hobby'
      get 'study'
    end
  end

end
