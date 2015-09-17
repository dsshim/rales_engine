require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  before do
    build_data
  end

  describe "GET show" do
    it "returns one item for an invoice_item" do
      get :show, format: :json, id: InvoiceItem.last.id

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item[:id]).to eq(5)
      expect(item[:name]).to eq("item name 2")
      expect(item[:description]).to eq("item desc 2")
      expect(item[:unit_price]).to eq("5050.0")
    end
  end
end
