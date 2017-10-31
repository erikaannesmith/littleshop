Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items

  namespace :admin do
    resources :items, only: [:index, :new, :create]

  get '/:name' => 'categories#show', as: :seecategory
  end
end
