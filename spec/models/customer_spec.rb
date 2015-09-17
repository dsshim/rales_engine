require "rails_helper"
require "factory_helper"

RSpec.describe Customer, type: :model do
  before do
    build_data
  end

  it "returns a random customer" do
    expect(Customer.random.class).to eq(Customer)
  end

  it "returns the favorite_merchant" do
    expect(Customer.first.favorite_merchant.name).to eq("merchant 5")
    expect(Customer.first.favorite_merchant.id).to eq(5)
    expect(Customer.find(2).favorite_merchant.name).to eq("merchant 4")
    expect(Customer.find(2).favorite_merchant.id).to eq(4)
  end
end
