require 'rails_helper'


RSpec.describe Api::V1::CustomersController, type: :controller do
  describe "GET index" do
    it "can view all customer" do
      get :index, format: :json

      customer = FactoryGirl.create(:customer)

      expect(response).to have_http_status(200)
      expect(customer.first_name).to eq("Bob")
    end
  end

  describe "GET show" do
    it "can view one customer" do
      customer = FactoryGirl.create(:customer)
      get :show, format: :json, id: customer.id

      expect(response).to have_http_status(200)
      expect(customer.first_name).to eq("Bob")
    end
  end

  describe "GET find" do
    it "can find a single customer" do
      customer = FactoryGirl.create(:customer)

      get :find, format: :json, id: customer.id

      expect(response).to have_http_status(200)
    end
  end

  describe "GET find_all" do
    it "can find all customers by any attribute" do
      customer = FactoryGirl.create_pair(:customer)

      get :find_all, format: :json, first_name: customer.first.first_name
      customers = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(customers.count).to eq(2)
    end
  end

  describe "GET random" do
    it "returns different customers when called twice" do
      FactoryGirl.create_list(:customer, 10)

      get :random, format: :json
      customer_1 = JSON.parse(response.body, symbolize_names: true)

      get :random, format: :json
      customer_2 = JSON.parse(response.body, symbolize_names: true)

      expect(customer_1[:last_name]).to_not eq(customer_2[:last_name])

    end
  end

  describe "GET favorite_merchant" do
    it "returns the customers favorite_merchant" do
      customer = Customer.create(id:1, first_name: "bob", last_name: "bobson")
      build_data

      get :favorite_merchant, format: :json, id: customer.id

      fav_merchant = JSON.parse(response.body, symbolize_names: true)

      expect(fav_merchant[:name]).to eq("merchant the second")
    end
  end

  def build_data
    Merchant.create(id: 1, name: "merchant")
    Merchant.create(id: 2, name: "merchant the second")
    Item.create(id: 1, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 1)
    Item.create(id: 2, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 2)
    Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "shipped")
    Invoice.create(id: 2, customer_id: 1, merchant_id: 2, status: "shipped")
    Invoice.create(id: 3, customer_id: 1, merchant_id: 2, status: "shipped")
    Transaction.create(id: 1, invoice_id: 1, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 2, invoice_id: 2, credit_card_number: "4242424242", result: "success")
    Transaction.create(id: 3, invoice_id: 3, credit_card_number: "4242424242", result: "success")
  end
end
