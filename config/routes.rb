Rails.application.routes.draw do

	namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: [:create]
      resources :days, only: [:index]
      resources :meals, only: [:create]
    end
  end
end
