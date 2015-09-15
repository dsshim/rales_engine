class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(customer_id: params[:id]).each{|invoice| invoice.transactions}
  end

end
