class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with get_item
  end

  def find
    respond_with Item.find_by(item_params)
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    respond_with Item.random
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Item.most_items(params[:quantity].to_i)
  end

  def best_day
    respond_with get_item.best_day
  end

  private

  def get_item
    Item.find_by(id: params[:id])
  end

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
