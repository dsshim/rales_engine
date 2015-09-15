class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  def find_all
    respond_with InvoiceItem.where(valid_params)
  end

  def random
    respond_with InvoiceItem.order("RANDOM()").first
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

  def valid_params
    params.require(:invoice_item)
      .permit(:item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
