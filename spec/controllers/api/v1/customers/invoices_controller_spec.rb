require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all invoices for a customer" do
      get :index, format: :json, id: Customer.first.id

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(invoices.first[:id]).to eq(1)
      expect(invoices.last[:id]).to eq(5)
      expect(invoices.first[:merchant_id]).to eq(1)
      expect(invoices.last[:merchant_id]).to eq(5)
    end
  end
end
