Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items

  resources :carts

  get '/cart', to: 'carts#show'

  get '/:name' => 'categories#show', as: :seecategory

  post '/cart_add', to: 'carts#add', as: :add_item
  post '/cart_sub', to: 'carts#subtract', as: :subtract_item
  post '/cart', to: 'carts#remove', as: :remove_item

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end

end
