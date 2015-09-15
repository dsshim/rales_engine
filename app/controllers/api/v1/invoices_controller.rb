class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def find
    if params.include?("customer_id")
      respond_with Invoice.find_by(customer_id: params[:customer_id])
    elsif params.include?("merchant_id")
      respond_with Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params.include?("status")
      respond_with Invoice.find_by(status: params[:status])
    else
      respond_with Invoice.find_by(id: params[:id])
    end
  end

  def find_all
    if params.include?("customer_id")
      respond_with Invoice.where(customer_id: params[:customer_id])
    elsif params.include?("merchant_id")
      respond_with Invoice.where(merchant_id: params[:merchant_id])
    elsif params.include?("status")
      respond_with Invoice.where(status: params[:status])
    end
  end

  def random
    respond_with Invoice.order("RANDOM()").first
  end
end
