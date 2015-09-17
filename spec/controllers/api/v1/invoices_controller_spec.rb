require 'rails_helper'


RSpec.describe Api::V1::InvoicesController, type: :controller do
  before do
    build_data
  end
  describe "GET index" do
    it "can view all invoices" do

      get :index, format: :json

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoices.count).to eq(5)
      expect(invoices.first[:customer_id]).to eq(1)
      expect(invoices.first[:merchant_id]).to eq(1)
      expect(invoices.first[:status]).to eq("shipped")
    end
  end

  describe "GET show" do
    it "can view one invoice" do

      get :show, format: :json, id: Invoice.last.id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice[:id]).to eq(5)
      expect(invoice[:customer_id]).to eq(1)
      expect(invoice[:merchant_id]).to eq(5)
      expect(invoice[:status]).to eq("shipped")
    end
  end

  describe "GET find" do
    it "can find one invoice by any parameter" do

      get :find, format: :json, invoice_id: Invoice.first.merchant_id

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoice[:customer_id]).to eq(1)
      expect(invoice[:merchant_id]).to eq(1)
      expect(invoice[:status]).to eq("shipped")
    end
  end

  describe "GET find_all" do
    it "can find all invoices by any parameter" do

      get :find_all, format: :json, customer_id: Invoice.first.customer_id

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(invoices.count).to eq(2)
      expect(invoices.first[:id]).to eq(1)
      expect(invoices.last[:id]).to eq(5)
      expect(invoices.first[:status]).to eq("shipped")
    end
  end

  describe "GET random" do
    it "returns a random invoice" do
      get :random, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
