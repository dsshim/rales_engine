require "rails_helper"
require "factory_helper"

RSpec.describe Transaction, type: :model do
  before do
    build_data
  end

  it "returns a random transaction" do
    expect(Transaction.random.class).to eq(Transaction)
  end
end
