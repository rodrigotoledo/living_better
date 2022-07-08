20.times.each do
  user = User.create(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    document: Faker::CPF.pretty,
    cns: Faker::Code.isbn,
    birthday_at: "1990-01-01".to_date,
    phone: '+55 33 91111-1111',
    status: :active
  )
end