class Api::V1::Items::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.find_by(id: params[:id]).invoice_items
  end
end
