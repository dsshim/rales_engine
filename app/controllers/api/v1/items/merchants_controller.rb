class Api::V1::Items::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.find_by(id: params[:id]).merchant
  end

end
