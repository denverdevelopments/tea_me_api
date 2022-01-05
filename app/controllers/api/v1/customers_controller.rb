class Api::V1::MerchantsController < ApplicationController

  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = [params.fetch(:page, 1).to_i, 1].max
    merchants = Merchant.offset((page - 1) * per_page).limit(per_page)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    if !Merchant.exists?(params[:id])
      render json: { error: "Merchant does not exist", code: 404 }, status: :not_found
    else
      merchant = Merchant.find(params[:id])
      render json: MerchantSerializer.new(merchant)
    end
  end

end
