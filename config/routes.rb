Rails.application.routes.draw do

  resources :squads
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
