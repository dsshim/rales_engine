require "rails_helper"
require "factory_helper"

RSpec.describe Merchant, type: :model do
  before do
    build_data
  end

  it "returns a favorite customer" do
    expect(Merchant.first.favorite_customer.first_name).to eq("bob")
    expect(Merchant.first.favorite_customer.last_name).to eq("bobson")
  end

  it "returns invoices with successful transactions" do
    expect(Merchant.first.success.count).to eq(1)
    expect(Merchant.first.success.first.transactions.first.result).to eq("success")
    expect(Merchant.first.success.first.class).to eq(Invoice)
  end

  it "returns invoices with failed transactions" do
    expect(Merchant.first.failed.count).to eq(1)
    expect(Merchant.first.failed.first.transactions.last.result).to eq("failed")
    expect(Merchant.first.failed.first.class).to eq(Invoice)
  end

  it "returns a random merchant" do
    expect(Merchant.random.class).to eq(Merchant)
  end

  it "returns total revenue by merchant" do
    expect(Merchant.first.total_revenue[:revenue]).to eq(BigDecimal.new(263910))
    expect(Merchant.last.total_revenue[:revenue]).to eq(BigDecimal.new(87970))
  end

  it "returns total revenue for a merchant by date" do
    date = Invoice.first.created_at

    expect(Merchant.first.total_revenue_by_date(date)[:revenue]).to eq(BigDecimal.new(263910))
    expect(Merchant.first.total_revenue_by_date(date).class).to eq(Hash)
    expect(Merchant.first.total_revenue_by_date(date).class).to eq(Hash)
  end

  it "returns customers with pending invoices" do
    expect(Merchant.first.customers_with_pending_invoices.first.first_name).to eq("bob")
    expect(Merchant.first.customers_with_pending_invoices.first.last_name).to eq("bobson")
  end

  it "returns x merchants by most revenue" do
    expect(Merchant.most_revenue(5).count).to eq(5)
    expect(Merchant.most_revenue(3).count).to eq(3)
    expect(Merchant.most_revenue(5).first.name).to eq("merchant")
    expect(Merchant.most_revenue(3).last.name).to eq("merchant 4")
  end

  it "returns x merchants by most items sold" do
    expect(Merchant.most_revenue(2).count).to eq(2)
    expect(Merchant.most_revenue(4).count).to eq(4)
    expect(Merchant.most_revenue(2).first.name).to eq("merchant")
    expect(Merchant.most_revenue(4).last.name).to eq("merchant 2")
  end

  it "returns revenue for a merchant by date" do
    date = Invoice.find(2).created_at
    date_2 = Invoice.first.created_at

    expect(Merchant.revenue(date)[:total_revenue]).to eq(BigDecimal.new(87970))
    expect(Merchant.revenue(date_2)[:total_revenue]).to eq(BigDecimal.new(263910))
  end
end
