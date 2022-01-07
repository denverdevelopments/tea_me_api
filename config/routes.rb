Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        resources :subscriptions, only: [:index, :create, :update, :destroy]
        # scope module: :customers do
        #   resources :subscriptions, only: [:index, :create, :update]
        # end
      end
      resources :teas, only: [:index]
    end
  end
end
