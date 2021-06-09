# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |_index|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    mobile_number: Faker::PhoneNumber.cell_phone,
    dob: Faker::Date.birthday(min_age: 10)
  )

  user.accounts.create(
    balance: 10.times.map { rand(10) }.join.to_i,
    address: Faker::Address.full_address
  )
end
