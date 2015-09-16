class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.random
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end

  def total_revenue
    respond_with Merchant.find_by(id: params[:id]).total_revenue(merchant_params)
  end

  def customers_with_pending_invoices
    respond_with Merchant.find_by(id: params[:id]).customers_with_pending_invoices
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

  def revenue
    respond_with Merchant.revenue(params[:date])
  end


private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at, :date)
  end

  # def merchant_revenue
  #   Merchant.all.map{|merchant|[merchant.id, merchant.most_revenue]}.sort_by{|id, revenue| revenue}.reverse[0..params[:quantity].to_i-1]
  # end

  # def valid_params
  #   params.require(:merchant)
  #     .permit(:name, :created_at, :updated_at)
  # end
end
