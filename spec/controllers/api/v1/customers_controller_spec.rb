require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "can view all customer" do
      get :index, format: :json

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer.first[:first_name]).to eq("bob")
    end
  end

  describe "GET show" do
    it "can view one customer" do
      get :show, format: :json, id: Customer.first.id

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer[:first_name]).to eq("bob")
    end
  end

  describe "GET find" do
    it "can find a single customer" do
      get :find, format: :json, id: Customer.first.id

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customer[:id]).to eq(1)
    end
  end

  describe "GET find_all" do
    it "can find all customers by any attribute" do
      get :find_all, format: :json, first_name: Customer.first.first_name
      customers = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(customers.count).to eq(2)
    end
  end

  describe "GET random" do
    it "returns different customers when called twice" do
      get :random, format: :json

      expect(response).to have_http_status(:success)

    end
  end

  describe "GET favorite_merchant" do
    it "returns the customers favorite_merchant" do
      get :favorite_merchant, format: :json, id: Customer.first.id

      fav_merchant = JSON.parse(response.body, symbolize_names: true)

      expect(fav_merchant[:name]).to eq("merchant 5")
    end
  end
end
