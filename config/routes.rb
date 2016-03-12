Rails.application.routes.draw do

  root 'welcome#index'

  resources :organisations
  resources :refugees

end
