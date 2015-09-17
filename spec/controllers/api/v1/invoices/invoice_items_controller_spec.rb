require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all invoice_items for an invoice" do
      get :index, format: :json, id: Invoice.last.id

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(invoices.first[:id]).to eq(5)
      expect(invoices.first[:item_id]).to eq(5)
      expect(invoices.first[:invoice_id]).to eq(5)
      expect(invoices.first[:unit_price]).to eq("8797.0")
    end
  end
end
