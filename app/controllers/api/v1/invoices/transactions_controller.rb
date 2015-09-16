class Api::V1::Invoices::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find_by(id: param[:id]).transactions
  end

end
