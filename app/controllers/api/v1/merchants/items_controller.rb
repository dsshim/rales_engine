class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index #joins & includes
    respond_with Merchant.find_by(id: params[:id]).items
  end
end
