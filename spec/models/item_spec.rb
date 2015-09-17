require "rails_helper"
require "factory_helper"

RSpec.describe Item, type: :model do
  before do
    build_data
  end

  it "returns the given number items by most revenue" do
    expect(Item.most_revenue(3).count).to eq(3)
    expect(Item.most_revenue(5).count).to eq(5)
    expect(Item.most_revenue(5).first.name).to eq("item name")
    expect(Item.most_revenue(5).first.description).to eq("item desc")
    expect(Item.most_revenue(5).first.unit_price).to eq(BigDecimal.new(7472))
  end

  it "returns the given number of items by quantity sold" do
    expect(Item.most_items(2).count).to eq(2)
    expect(Item.most_items(5).count).to eq(5)
    expect(Item.most_items(5).last.name).to eq("item name 2")
    expect(Item.most_items(5).last.description).to eq("item desc 2")
    expect(Item.most_items(5).last.unit_price).to eq(BigDecimal.new(5050))
  end

  it "returns the best sales day for a given item" do
    expect(Item.first.best_day[:best_day].month).to eq(9)
    expect(Item.first.best_day[:best_day].year).to eq(2015)
    expect(Item.first.best_day.class).to eq(Hash)
  end

  it "returns revenue for an item" do
    expect(Item.first.revenue).to eq(BigDecimal.new(263910))
    expect(Item.last.revenue).to eq(BigDecimal.new(87970))
  end

  it "returns the amount sold for an item" do
    expect(Item.amount_sold(5).count).to eq(5)
    expect(Item.amount_sold(5).first).to eq(1)
    expect(Item.amount_sold(5).last).to eq(5)
  end

  it "returns a random item" do
    expect(Item.random.class).to eq(Item)
  end
end
