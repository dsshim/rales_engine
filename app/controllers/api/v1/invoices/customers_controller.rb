class Api::V1::Invoices::CustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.find_by(id: params[:id]).customer
  end
end
