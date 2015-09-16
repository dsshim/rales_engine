require 'rails_helper'


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

      get :favorite_customer, format: :json

      favorite_customer = JSON.parse(response.body, symbolize_names: true)

      expect(favorite_customer[:last_name]).to eq("")

    end
  end

  def build_data
    Merchant.create(id: 1, name: "merchant")
    Merchant.create(id: 2, name: "merchant 2")
    Merchant.create(id: 3, name: "merchant 3")
    Merchant.create(id: 4, name: "merchant 4")
    Merchant.create(id: 5, name: "merchant 5")
  end
end
