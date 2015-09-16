require 'rails_helper'


RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  before do
    build_data
  end
  describe "GET index" do
    it "can view all invoice items" do

      get :index, format: :json

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoice_items.count).to eq(5)
      expect(invoice_items.first[:item_id]).to eq(1)
      expect(invoice_items.first[:invoice_id]).to eq(1)
      expect(invoice_items.first[:quantity]).to eq(30)
      expect(invoice_items.first[:unit_price]).to eq("8797.0")
    end
  end

  describe "GET show" do
    it "can view one invoice item" do

      get :show, format: :json, id: InvoiceItem.first.id

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoice_item[:item_id]).to eq(1)
      expect(invoice_item[:invoice_id]).to eq(1)
      expect(invoice_item[:quantity]).to eq(30)
      expect(invoice_item[:unit_price]).to eq("8797.0")
    end
  end

  describe "GET find" do
    it "can find one invoice item by any parameter" do

      get :find, format: :json, invoice_id: InvoiceItem.first.invoice_id

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoice_item[:item_id]).to eq(1)
      expect(invoice_item[:invoice_id]).to eq(1)
      expect(invoice_item[:quantity]).to eq(10)
      expect(invoice_item[:unit_price]).to eq("8797.0")
    end
  end

  describe "GET find_all" do
    it "can find all invoice items by any parameter" do

      get :find_all, format: :json, item_id: InvoiceItem.first.item_id

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(invoice_items.count).to eq(5)
      expect(invoice_items.first[:id]).to eq(1)
      expect(invoice_items.last[:id]).to eq(5)
      expect(invoice_items.first[:quantity]).to eq(30)
      expect(invoice_items.last[:quantity]).to eq(10)
    end
  end

  describe "GET random" do
    it "returns a random invoice item" do
      get :random, format: :json
      invoice_item_1 = JSON.parse(response.body, symbolize_names: true)

      get :random, format: :json
      invoice_item_2 = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item_1[:id]).to_not eq(invoice_item_2[:id])
    end
  end

  def build_data
    Merchant.create(id: 1, name: "merchant")
    Item.create(id: 1, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 1)
    Customer.create(id: 1, first_name: "bob", last_name: "bobson")
    Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "shipped")
    InvoiceItem.create(id: 1, item_id: 1, invoice_id: 1, quantity: 30, unit_price: 8797)
    InvoiceItem.create(id: 2, item_id: 1, invoice_id: 1, quantity: 10, unit_price: 8797 )
    InvoiceItem.create(id: 3, item_id: 1, invoice_id: 1, quantity: 10, unit_price: 8797 )
    InvoiceItem.create(id: 4, item_id: 1, invoice_id: 1, quantity: 10, unit_price: 8797 )
    InvoiceItem.create(id: 5, item_id: 1, invoice_id: 1, quantity: 10, unit_price: 8797 )
  end
end
