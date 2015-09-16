require 'rails_helper'


RSpec.describe Api::V1::InvoicesController, type: :controller do
  before do
    build_data
  end
  describe "GET index" do
    it "can view all invoices" do

      get :index, format: :json

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoices.count).to eq(3)
      expect(invoices.first[:customer_id]).to eq(1)
      expect(invoices.first[:merchant_id]).to eq(1)
      expect(invoices.first[:status]).to eq("shipped")
    end
  end

  describe "GET show" do
    it "can view one invoice" do

      get :show, format: :json, id: Invoice.last.id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoice[:id]).to eq(3)
      expect(invoice[:customer_id]).to eq(1)
      expect(invoice[:merchant_id]).to eq(1)
      expect(invoice[:status]).to eq("not shipped")
    end
  end

  describe "GET find" do
    it "can find one invoice by any parameter" do

      get :find, format: :json, invoice_id: Invoice.first.merchant_id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoice[:customer_id]).to eq(1)
      expect(invoice[:merchant_id]).to eq(1)
      expect(invoice[:status]).to eq("shipped")
    end
  end

  describe "GET find_all" do
    it "can find all invoices by any parameter" do

      get :find_all, format: :json, customer_id: Invoice.first.customer_id

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoices.count).to eq(3)
      expect(invoices.first[:id]).to eq(1)
      expect(invoices.last[:id]).to eq(3)
      expect(invoices.first[:status]).to eq("shipped")
      expect(invoices.last[:status]).to eq("not shipped")
    end
  end

  describe "GET random" do
    it "returns a random invoice" do
      get :random, format: :json
      invoice_1 = JSON.parse(response.body, symbolize_names: true)

      get :random, format: :json
      invoice_2 = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_1[:id]).to_not eq(invoice_2[:id])
    end
  end

  def build_data
    Merchant.create(id: 1, name: "merchant")
    Item.create(id: 1, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 1)
    Customer.create(id: 1, first_name: "bob", last_name: "bobson")
    Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "shipped")
    Invoice.create(id: 2, customer_id: 1, merchant_id: 1, status: "shipped")
    Invoice.create(id: 3, customer_id: 1, merchant_id: 1, status: "not shipped")
  end
end
