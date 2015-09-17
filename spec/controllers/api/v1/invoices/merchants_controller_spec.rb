require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  before do
    build_data
  end

  describe "GET show" do
    it "returns one merchant for an invoice" do
      get :show, format: :json, id: Invoice.first.id

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:id]).to eq(1)
      expect(merchant[:name]).to eq("merchant")
    end
  end
end
