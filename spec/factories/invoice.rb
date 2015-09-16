FactoryGirl.define do
  factory :invoice do |f|
    f.customer_id { 1 }
    f.merchant_id { 1 }
    f.status { "shipped"}
  end
end
