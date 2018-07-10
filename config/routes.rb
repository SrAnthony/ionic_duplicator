Rails.application.routes.draw do
  devise_for :users
  resources :platforms
  resources :apps
  get 'platforms/copy_images/:id', to: 'platforms#copy_images', as: :copy_images

  root 'apps#index'
end
