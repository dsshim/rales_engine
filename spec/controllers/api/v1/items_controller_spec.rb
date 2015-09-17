require 'rails_helper'
require 'factory_helper'


RSpec.describe Api::V1::ItemsController, type: :controller do
  before do
    build_data
  end

  describe "GET index" do
    it "can view all items" do

      get :index, format: :json

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(items.count).to eq(5)
      expect(items.first[:name]).to eq("item name")
      expect(items.first[:description]).to eq("item desc")
      expect(items.first[:merchant_id]).to eq(1)
      expect(items.first[:unit_price]).to eq("7472.0")
    end
  end

  describe "GET show" do
    it "can view one item" do

      get :show, format: :json, id: Item.last.id

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item[:name]).to eq("item name 2")
      expect(item[:description]).to eq("item desc 2")
      expect(item[:merchant_id]).to eq(5)
      expect(item[:unit_price]).to eq("5050.0")
    end
  end

  describe "GET find" do
    it "can find one item by any parameter" do

      get :find, format: :json, name: Item.first.name

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(item[:name]).to eq("item name")
      expect(item[:description]).to eq("item desc")
      expect(item[:merchant_id]).to eq(1)
      expect(item[:unit_price]).to eq("7472.0")
    end
  end

  describe "GET find_all" do
    it "can find all items by any parameter" do

      get :find_all, format: :json, unit_price: Item.first.unit_price

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:success)
      expect(items.count).to eq(1)
      expect(items.first[:id]).to eq(1)
      expect(items.last[:id]).to eq(1)
      expect(items.first[:name]).to eq("item name")
      expect(items.last[:name]).to eq("item name")
    end
  end

  describe "GET random" do
    it "returns a random item" do
      get :random, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET most_revenue" do
    it "returns item with most revenue" do
      get :most_revenue, format: :json, quantity: 2
      revenue = JSON.parse(response.body, symbolize_names: true)

      expect(revenue.first[:id]).to eq(1)
      expect(revenue.last[:id]).to eq(3)
      expect(revenue.first[:name]).to eq("item name")
      expect(revenue.last[:name]).to eq("item name 2")
      expect(revenue.first[:merchant_id]).to eq(1)
      expect(revenue.last[:merchant_id]).to eq(3)
    end
  end

  describe "GET most_items" do
    it "returns most items sold" do
      get :most_items, format: :json, quantity: 3

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.first[:id]).to eq(1)
      expect(items.last[:id]).to eq(4)
      expect(items.first[:name]).to eq("item name")
      expect(items.last[:name]).to eq("item name 2")
      expect(items.first[:unit_price]).to eq("7472.0")
      expect(items.last[:unit_price]).to eq("5050.0")
    end
  end

  describe "GET best_day" do
    it "returns the best sales day for an item"do
      get :best_day, format: :json, id: 2

      best_day = JSON.parse(response.body, symbolize_names: true)

      expect(best_day.class).to eq(Hash)
      expect(Date.parse(best_day[:best_day]).year).to eq(2015)
    end
  end
end
