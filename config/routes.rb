Rails.application.routes.draw do
  root to: 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: :show do
    get :advanced, on: :collection, to: 'recipes#advanced_index'
    get :advanced, on: :member, to: 'recipes#advanced_show'
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :recipes, only: [ :index, :show ]
    end
  end
end
