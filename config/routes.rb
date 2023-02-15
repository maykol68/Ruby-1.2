Rails.application.routes.draw do
  resources :categoria, expect: :show
  resources :products, path: '/'

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
  end



  #delete '/products/:id', to: 'products#destroy'
  #patch '/products/:id', to: 'products#update'
  #post '/products', to: 'products#create'
  #get '/products/new', to: 'products#new', as: :new_product
  #get '/products', to: 'products#index'
  #get '/products/:id', to: 'products#show', as: :product
  #get '/products/:id/edit', to: 'products#edit', as: :edit_product

end
