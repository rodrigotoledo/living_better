# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  birthday_at :date             not null
#  cns         :string           not null
#  document    :string           not null
#  email       :string           not null
#  name        :string           not null
#  phone       :string           not null
#  status      :string           default(NULL), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    document { Faker::CPF.pretty }
    cns { Faker::Code.isbn }
    email { Faker::Internet.email }
    birthday_at { "1990-01-01".to_date }
    phone { '+55 33 91111-1111' }
    status { :active }
  end
end
