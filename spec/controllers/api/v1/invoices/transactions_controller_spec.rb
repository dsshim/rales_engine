require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all transactions for an invoice" do
      get :index, format: :json, id: Invoice.first.id

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions.first[:id]).to eq(1)
      expect(transactions.last[:id]).to eq(6)
      expect(transactions.first[:invoice_id]).to eq(1)
      expect(transactions.last[:invoice_id]).to eq(1)
      expect(transactions.first[:result]).to eq("success")
      expect(transactions.last[:result]).to eq("failed")
    end
  end
end
