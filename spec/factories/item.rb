FactoryGirl.define do
  factory :item do |f|
    f.name { "fake name" }
    f.description { "fake description" }
    f.unit_price { Random.new.rand(1000)}
    f.merchant_id { 1 }
  end
end
