require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all invoices for a merchant" do
      get :index, format: :json, id: Merchant.first.id

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(invoices.first[:id]).to eq(1)
      expect(invoices.first[:customer_id]).to eq(1)
      expect(invoices.first[:merchant_id]).to eq(1)
      expect(invoices.first[:status]).to eq("shipped")
    end
  end
end
