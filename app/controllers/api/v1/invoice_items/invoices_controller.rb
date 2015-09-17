class Api::V1::InvoiceItems::InvoicesController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find_by(id: params[:id]).invoice
  end
end
