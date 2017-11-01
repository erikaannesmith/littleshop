Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  resources :categories, :except => [:show]
  get ':slug' => 'categories#show'

  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end

  resources :users, only: [:new, :create, :show]

  root 'welcome#index'

  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup' => 'users#new'


end
