class Api::V1::Invoices::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.find_by(id: params[:id]).merchant
  end
end
