class Api::V1::TeasController < ApplicationController
  before_action :tea_exists, :set_tea, only: [:show, :create, :destroy]

  def index
    teas = Tea.all
    render json: ItemSerializer.new(teas)
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item), status: :created
    else
      render json: {error: "Invalid Item", code: 400 }, status: :bad_request
    end
  end

  def update
    if @item.update(item_params)
      render json: ItemSerializer.new(@item)
    else
      render json: { error: "Invalid Inputs", code: 400 }, status: :bad_request
    end
  end

  def destroy
    @item.destroy
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_exists
      render json: { error: "Item does not exist", code: 404 }, status: :not_found if !Item.exists?(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :unit_price, :merchant_id )
    end
end
