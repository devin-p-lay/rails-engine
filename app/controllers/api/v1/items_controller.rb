class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    if Item.exists?(params[:id])
      render json: ItemSerializer.new(Item.find(params[:id]))
    else
      render json: { data: { details: 'No item matches this id' } },
             status: 404
    end
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params)), status: 201
  end

  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      render json: ItemSerializer.new(item)
    else
      render json: {error: 'could not update item'}, status: 400
    end
  end

  def destroy
    render json: Item.delete(params[:id]), status: 204
  end

    private

      def item_params
        params.permit(:name, :description, :unit_price, :merchant_id)
      end
end