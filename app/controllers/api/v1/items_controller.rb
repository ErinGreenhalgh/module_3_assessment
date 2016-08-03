class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.destroy(params[:id]), status: 204
  end

  def create
    byebug
    render json: Item.create(params["item"]), status: 201
  end

  private
  # def item_params
  #   params.require(:item).permit(:name, :description, :image_url)
  # end

end
