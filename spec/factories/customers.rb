FactoryGirl.define do
  factory :customer do |f|
    f.first_name { "Bob" }
    f.last_name { Faker::Name.last_name }
  end
end
