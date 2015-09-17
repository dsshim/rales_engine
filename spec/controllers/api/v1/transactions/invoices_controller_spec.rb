require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
  before do
    build_data
  end

  describe "GET show" do
    it "returns one invoice for a transaction" do
      get :show, format: :json, id: Transaction.last.id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(1)
      expect(invoice[:customer_id]).to eq(1)
      expect(invoice[:merchant_id]).to eq(1)
      expect(invoice[:status]).to eq("shipped")
    end
  end
end
