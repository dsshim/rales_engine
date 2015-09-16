require 'rails_helper'


RSpec.describe Api::V1::ItemsController, type: :controller do
  before do
    build_data
  end
  describe "GET index" do
    it "can view all items" do

      get :index, format: :json

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(items.count).to eq(5)
      expect(items.first[:name]).to eq("item name")
      expect(items.first[:description]).to eq("item desc")
      expect(items.first[:merchant_id]).to eq(1)
      expect(items.first[:unit_price]).to eq(7472)
    end
  end

  describe "GET show" do
    it "can view one item" do

      get :show, format: :json, id: Item.last.id

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(item[:name]).to eq("item name 5")
      expect(item[:description]).to eq("item desc")
      expect(item[:merchant_id]).to eq(1)
      expect(item[:unit_price]).to eq(7475)
    end
  end

  describe "GET find" do
    it "can find one item by any parameter" do

      get :find, format: :json, name: Item.first.name

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(item[:name]).to eq("item name")
      expect(item[:description]).to eq("item desc")
      expect(item[:merchant_id]).to eq(1)
      expect(item[:unit_price]).to eq(7472)
    end
  end

  describe "GET find_all" do
    it "can find all items by any parameter" do

      get :find_all, format: :json, unit_price: Item.first.unit_price

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(items.count).to eq(4)
      expect(items.first[:id]).to eq(1)
      expect(items.last[:id]).to eq(4)
      expect(items.first[:name]).to eq("item name")
      expect(items.last[:name]).to eq("item name 4")
    end
  end

  describe "GET random" do
    it "returns a random item" do
      get :random, format: :json
      item_1 = JSON.parse(response.body, symbolize_names: true)

      get :random, format: :json
      item_2 = JSON.parse(response.body, symbolize_names: true)

      expect(item_1[:id]).to_not eq(item_2[:id])
    end
  end

  def build_data
    Merchant.create(id: 1, name: "merchant")
    Item.create(id: 1, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 1)
    Item.create(id: 2, name: "item name 2", description: "item desc", unit_price: 7472, merchant_id: 1)
    Item.create(id: 3, name: "item name 3", description: "item desc", unit_price: 7472, merchant_id: 1)
    Item.create(id: 4, name: "item name 4", description: "item desc", unit_price: 7472, merchant_id: 1)
    Item.create(id: 5, name: "item name 5", description: "item desc", unit_price: 7475, merchant_id: 1)
  end
end
