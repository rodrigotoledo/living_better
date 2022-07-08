FactoryBot.define do
  factory :address do
    zipcode { "35300-100" }
    street { Faker::Address.street_address }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { "MG" }
  end
end
