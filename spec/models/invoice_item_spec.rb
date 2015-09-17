require "rails_helper"
require "factory_helper"

RSpec.describe InvoiceItem, type: :model do
  before do
    build_data
  end

  it "returns a random invoice_item" do
    expect(InvoiceItem.random.class).to eq(InvoiceItem)
  end
end
