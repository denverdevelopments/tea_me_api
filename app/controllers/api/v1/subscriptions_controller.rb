class Api::V1::SubscriptionsController < ApplicationController
  before_action :subscription_exists, :set_subscription, only: [:update, :destroy]

  def index
    client = Customer.find(params[:customer_id])
    subs = client.subscriptions
    render json: SubscriptionSerializer.new(subs)
  end

  def create
    new_sub = Subscription.new(subscription_params) #, frequency: 0)
    if new_sub.save
      render json: SubscriptionSerializer.new(new_sub), status: :created
    else
      render json: {error: "Invalid Subscription", code: 400 }, status: :bad_request
    end
  end

  def update
    if @sub.update(subscription_params)
      render json: SubscriptionSerializer.new(@sub)
    else
      render status: :not_found
    end
  end

  def destroy
    @sub.destroy
  end

  private

    def set_subscription
      if Customer.exists?(params[:customer_id]) && Tea.exists?(params[:tea_id])
        @sub = Subscription.find(params[:id])
      else
        render json: { error: "Subscription error", code: 404 }, status: :not_found
      end
    end

    def subscription_exists
      render json: { error: "Subscription does not exist", code: 404 }, status: :not_found if !Subscription.exists?(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit( :title, :status, :price, :frequency, :customer_id, :tea_id )
    end
end
