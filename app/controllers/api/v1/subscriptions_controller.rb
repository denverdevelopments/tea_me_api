class Api::V1::SubscriptionController < ApplicationController
  before_action :subscription_exists, :set_subscription, only: [:destroy]

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: {error: "Invalid Subscription", code: 400 }, status: :bad_request
    end
  end

  def destroy
    @subscription.destroy
  end

  private

    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_exists
      render json: { error: "Subscription does not exist", code: 404 }, status: :not_found if !Subscription.exists?(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit( :title, :status, :price, :customer_id, :tea_id )
    end
end
