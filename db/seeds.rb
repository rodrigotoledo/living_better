20.times.each do
  user = User.new(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.email,
    document: Faker::CPF.pretty,
    cns: Faker::Code.isbn,
    birthday_at: "1990-01-01".to_date,
    phone: '+55 33 91111-1111',
    status: 1
  )
  user.photo.attach(io: File.open("#{Rails.root}/spec/files/photo.png"), filename: "photo.png", content_type: "image/png")
  user.build_address(
    street: Faker::Address.street_address,
    zipcode: '35300-100',
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: 'MG'
  )
  user.save!

end