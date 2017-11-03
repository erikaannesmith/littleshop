Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items

  resources :carts

  get '/cart', to: 'carts#show'
  post '/cart_add', to: 'carts#add', as: :add_item
  post '/cart_sub', to: 'carts#subtract', as: :subtract_item

  post '/cart', to: 'carts#remove', as: :remove_item

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end

  resources :users, only: [:new, :create, :show]

  root 'welcome#index'

  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup' => 'users#new'


  get '/dashboard' => "users#show", as: "dashboard"
  
  resources :categories, :except => [:show]
  get ':slug' => 'categories#show', as: :category_slug


end
