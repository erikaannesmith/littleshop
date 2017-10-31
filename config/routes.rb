Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  get '/:name' => 'categories#show', as: :seecategory
  namespace :admin do
    resources :items, only: [:index, :new, :create]
  end

  root 'welcome#index'

  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
