FactoryGirl.define do
  factory :invoice_item do |f|
    f.item_id { 1 }
    f.invoice_id { 1 }
    f.quantity { Random.new.rand(10)}
    f.unit_price {Random.new.rand(10000)}
  end
end
