require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  before do
    build_data
  end

  describe "GET show" do
    it "returns one merchant for an item" do
      get :index, format: :json, id: Item.first.id

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:id]).to eq(1)
      expect(merchant[:name]).to eq("merchant")
    end
  end
end
