require 'rails_helper'


RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  before do
    build_data
  end
  describe "GET index" do
    it "can view all invoice items" do

      get :index, format: :json

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
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

      expect(response).to have_http_status(:success)
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

      expect(response).to have_http_status(:success)
      expect(invoice_item[:item_id]).to eq(1)
      expect(invoice_item[:invoice_id]).to eq(1)
      expect(invoice_item[:quantity]).to eq(30)
      expect(invoice_item[:unit_price]).to eq("8797.0")
    end
  end

  describe "GET find_all" do
    it "can find all invoice items by any parameter" do

      get :find_all, format: :json, item_id: InvoiceItem.first.item_id

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice_items.count).to eq(1)
      expect(invoice_items.first[:id]).to eq(1)
      expect(invoice_items.last[:quantity]).to eq(30)
    end
  end

  describe "GET random" do
    it "returns a random invoice item" do
      get :random, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
