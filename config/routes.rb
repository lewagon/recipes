Rails.application.routes.draw do
  root to: 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: :show do
    get :advanced_index, on: :collection
    get :advanced_show, on: :member
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :recipes, only: [ :index, :show ]
    end
  end
end
