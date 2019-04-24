Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
end

devise_scope :user do
  get 'login', to: 'devise/sessions#new'
end
