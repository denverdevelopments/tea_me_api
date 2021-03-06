class Api::V1::CustomersController < ApplicationController

  def index
    customers = Customer.all
    render json: CustomerSerializer.new(customers)
  end

  def show
    if !Customer.exists?(params[:id])
      render json: { error: "Customer does not exist", code: 404 }, status: :not_found
    else
      client = Customer.find(params[:id])
      render json: CustomerSerializer.new(client)
    end
  end
end
