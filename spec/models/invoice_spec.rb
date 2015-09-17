require "rails_helper"
require "factory_helper"

RSpec.describe Invoice, type: :model do
  before do
    build_data
  end

  it "returns invoices with successful transactions" do
    expect(Invoice.success.count).to eq(5)
    expect(Invoice.success.first.transactions.first.result).to eq("success")
  end

  it "returns invoices with failed transactions" do
    expect(Invoice.failed.count).to eq(1)
    expect(Invoice.failed.first.transactions.last.result).to eq("failed")
  end

  it "returns a favorite_merchant id" do
    expect(Invoice.favorite_merchant).to eq(5)
  end

  it "returns a favorite_customer id" do
    expect(Invoice.favorite_customer).to eq(2)
  end

  it "returns a random invoice" do
    expect(Invoice.random.class).to eq(Invoice)
  end
end
