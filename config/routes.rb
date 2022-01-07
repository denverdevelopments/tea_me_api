Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index] do
        resources :subscriptions, only: [:index, :create, :update]
        # scope module: :customers do
        #   resources :subscriptions, only: [:index, :create, :update]
        # end
      end

      resources :teas, only: [:index]
      # resources :subscriptions, only: [:create,:update]
    end
  end
end
