Rails.application.routes.draw do

  resources :squads do
    resources :members do
      member do
        get 'approve'
        get 'reject'
      end
    end
    member do
      get 'join'
      #put 'join'
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#index'

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
