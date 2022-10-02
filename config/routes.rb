Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :brands, only: [:index, :create] do
        collection{
          get   ":id/models", to: "brands#models"
          post  ":id/models", to: "brands#model"
        }
      end
      resources :models, only: [:index, :create, :update] do
        collection{
          put "/:id", to: "models#update"
          post :import
        }
      end
    end
  end

end
