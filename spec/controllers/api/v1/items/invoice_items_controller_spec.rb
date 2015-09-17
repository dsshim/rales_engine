require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all invoice_items for an item" do
      get :index, format: :json, id: Item.first.id

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_items.first[:id]).to eq(1)
      expect(invoice_items.first[:item_id]).to eq(1)
      expect(invoice_items.first[:quantity]).to eq(30)
      expect(invoice_items.first[:unit_price]).to eq("8797.0")
    end
  end
end
