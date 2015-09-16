require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "can view all merchants" do

      get :index, format: :json

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(merchants.count).to eq(5)
      expect(merchants.first[:name]).to eq("merchant")
    end
  end

  describe "GET show" do
    it "can view one merchant" do

      get :show, format: :json, id: Merchant.last.id

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(merchant[:name]).to eq("merchant 5")
    end
  end

  describe "GET find" do
    it "can find one merchant by any parameter" do

      get :find, format: :json, name: Merchant.first.name

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(merchant[:name]).to eq("merchant")
    end
  end

  describe "GET find_all" do
    it "can find all merchants by any parameter" do

      get :find_all, format: :json, name: Merchant.first.name

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(merchants.count).to eq(1)
      expect(merchants.first[:name]).to eq("merchant")
    end
  end

  describe "GET random" do
    it "returns a random merchant" do
      get :random, format: :json
      merchant_1 = JSON.parse(response.body, symbolize_names: true)

      get :random, format: :json
      merchant_2 = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_1[:id]).to_not eq(merchant_2[:id])
    end
  end

  describe "GET favorite_customer" do
    it "returns the most active customer for a merchant" do
      get :favorite_customer, format: :json, id: Merchant.last.id

      favorite_customer = JSON.parse(response.body, symbolize_names: true)

      expect(favorite_customer[:first_name]).to eq("bob")
      expect(favorite_customer[:last_name]).to eq("bobson")
    end
  end

  describe "GET total_revenue" do
    it "returns total revenue for a specific merchant" do
      get :total_revenue, format: :json, id: Merchant.first.id

      revenue = JSON.parse(response.body, symbolize_names: true)

      expect(revenue[:revenue]).to eq("263910.00")
    end
  end

  describe "GET customers_with_pending_invoices" do
    it "returns all customers with pending invoices" do
      get :customers_with_pending_invoices, format: :json, id: Merchant.first.id

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(customers.count).to eq(1)
      expect(customers.first[:first_name]).to eq("bob")
      expect(customers.first[:last_name]).to eq("bobson")
      expect(customers.first[:id]).to eq(1)
    end
  end

  describe "GET most_revenue" do
    it "returns the x top merchants by revenue" do
      get :most_revenue, format: :json, quantity: 3

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.first[:id]).to eq(1)
      expect(merchants.last[:id]).to eq(4)
      expect(merchants.first[:name]).to eq("merchant")
      expect(merchants.last[:name]).to eq("merchant 4")
    end
  end

  describe "GET most_items" do
    it "returns the x top merchants by items sold" do
      get :most_items, format: :json, quantity: 2

      merchants = JSON.parse(response.body, symbolize_names: true)
      
      expect(merchants.first[:id]).to eq(1)
      expect(merchants.last[:id]).to eq(3)
      expect(merchants.first[:name]).to eq("merchant")
      expect(merchants.last[:name]).to eq("merchant 3")
    end
  end
end
