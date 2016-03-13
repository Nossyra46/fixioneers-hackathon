Rails.application.routes.draw do
  root 'welcome#index'

  resources :organisations
  resources :refugees
  resource :sessions, only: [:new, :create, :destroy]
  resource :sms, only: [:create]
end
