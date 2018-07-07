Rails.application.routes.draw do
  resources :platforms
  resources :apps
  get 'platforms/copy_images/:id', to: 'platforms#copy_images', as: :copy_images

  root 'apps#index'
end
