require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all transactions for a customer" do
      get :index, format: :json, id: Customer.first.id

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions.first[:id]).to eq(1)
      expect(transactions.first[:result]).to eq("success")
      expect(transactions.last[:result]).to eq("failed")
    end
  end
end
