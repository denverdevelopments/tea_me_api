Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index] do
        scope module: :customers do
          resources :subscriptions, only: :index
          end
      end

      resources :teas, only: [:index]
      resources :subscriptions, only: [:create,:new,:destroy]
    end
  end
end
