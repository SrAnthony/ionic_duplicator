Rails.application.routes.draw do
  resources :platforms
  resources :apps
  get 'platforms/copy_images/:id', to: 'platforms#copy_images', as: :copy_images

  get 'platforms/signing/:id', to: 'platforms#signing', as: :signing
  get 'platforms/files/:id', to: 'platforms#files', as: :files
  get 'platforms/update/:id', to: 'platforms#update', as: :update

  root 'apps#index'
end
