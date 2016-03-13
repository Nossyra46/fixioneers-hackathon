Rails.application.routes.draw do
  root 'welcome#index'

  resources :organisations
  resources :refugees
  resource :sessions, only: [:new, :create, :destroy]
  resource :sms, only: [:create] do
    post ':id/single_message', to: :single_message, as: 'single_message'
  end
end
