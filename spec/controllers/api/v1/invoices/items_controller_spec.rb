require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "returns all items for an invoice" do
      get :index, format: :json, id: Invoice.last.id

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.first[:id]).to eq(5)
      expect(items.first[:name]).to eq("item name 2")
      expect(items.first[:description]).to eq("item desc 2")
      expect(items.first[:merchant_id]).to eq(5)
    end
  end
end
