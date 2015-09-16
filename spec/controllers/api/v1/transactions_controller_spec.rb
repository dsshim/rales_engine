require 'rails_helper'


RSpec.describe Api::V1::TransactionsController, type: :controller do
  before do
    build_data
  end
  describe "GET index" do
    it "can view all transactions" do

      get :index, format: :json

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(transactions.count).to eq(6)
      expect(transactions.first[:invoice_id]).to eq(1)
      expect(transactions.first[:credit_card_number]).to eq("4242424242")
      expect(transactions.first[:result]).to eq("success")
    end
  end

  describe "GET show" do
    it "can view one transaction" do

      get :show, format: :json, id: Transaction.last.id

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(transaction[:id]).to eq(6)
      expect(transaction[:credit_card_number]).to eq("4242424252")
      expect(transaction[:result]).to eq("failed")
    end
  end

  describe "GET find" do
    it "can find one transaction by any parameter" do

      get :find, format: :json, credit_card_number: Transaction.first.credit_card_number

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(transaction[:id]).to eq(1)
      expect(transaction[:credit_card_number]).to eq("4242424242")
      expect(transaction[:result]).to eq("success")
    end
  end

  describe "GET find_all" do
    it "can find all transactions by any parameter" do

      get :find_all, format: :json, credit_card_number: Transaction.first.credit_card_number

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(transactions.count).to eq(5)
      expect(transactions.first[:id]).to eq(1)
      expect(transactions.last[:id]).to eq(5)
      expect(transactions.first[:result]).to eq("success")
      expect(transactions.last[:result]).to eq("success")
    end
  end

  describe "GET random" do
    it "returns a random invoice" do
      get :random, format: :json
      transaction_1 = JSON.parse(response.body, symbolize_names: true)

      get :random, format: :json
      transaction_2 = JSON.parse(response.body, symbolize_names: true)

      expect(transaction_1[:id]).to_not eq(transaction_2[:id])
    end
  end

  def build_data
    Merchant.create(id: 1, name: "merchant")
    Item.create(id: 1, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 1)
    Customer.create(id: 1, first_name: "bob", last_name: "bobson")
    Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "shipped")
    Transaction.create(id: 1, invoice_id: 1, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 2, invoice_id: 1, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 3, invoice_id: 1, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 4, invoice_id: 1, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 5, invoice_id: 1, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 6, invoice_id: 1, credit_card_number: "4242424252", result: "failed")
  end
end
