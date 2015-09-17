require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do
  before do
    build_data
  end

  describe "GET show" do
    it "returns one invoices for an invoice_item" do
      get :show, format: :json, id: InvoiceItem.last.id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(5)
      expect(invoice[:merchant_id]).to eq(5)
      expect(invoice[:status]).to eq("shipped")
    end
  end
end
