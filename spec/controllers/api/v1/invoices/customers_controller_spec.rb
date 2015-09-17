require 'rails_helper'
require 'factory_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  before do
    build_data
  end

  describe "GET show" do
    it "returns one customer for an invoice" do
      get :show, format: :json, id: Invoice.last.id

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:first_name]).to eq("bob")
      expect(customer[:last_name]).to eq("bobson")
    end
  end
end
