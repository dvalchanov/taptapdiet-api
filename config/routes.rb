Rails.application.routes.draw do

	namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: [:create]
      
      resources :days, only: [:index] do 
        resources :feelings, only: [:create, :update]
        resources :meals, only: [:create, :update, :destroy]
      end

    end
  end
end
