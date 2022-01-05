class Api::V1::Customers::SubscriptionsController < ApplicationController

  def index
    client = Customer.find(params[:customer_id])
    subs = client.subscriptions
    render json: SubscriptionSerializer.new(subs)
  end

end
