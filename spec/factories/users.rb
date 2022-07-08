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
#  status      :integer          default("inactive"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
include ActionDispatch::TestProcess
FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    document { Faker::CPF.pretty }
    cns { Faker::Code.isbn }
    email { Faker::Internet.email }
    birthday_at { "1990-01-01".to_date }
    phone { '+55 33 91111-1111' }
    status { :active }
    after(:build) do |user|
      user.photo.attach(io: File.open("spec/files/photo.png"), filename: 'photo.png', content_type: 'image/png')
    end
  end
end
