Rails.application.routes.draw do
  resources :apps
  get 'apps/create_app/:id/:platform', to: 'apps#create_app', as: :create_app

  root 'apps#index'
end
