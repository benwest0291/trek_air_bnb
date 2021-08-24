require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Property.destroy_all
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Team.name.strip,
    address: Faker::Address.full_address,
    postcode: Faker::Address.postcode,
    password: "123456"
  )
  user.save
end

puts "new users created"


100.times do
  property = Property.new(
    address: Faker::Address.full_address,
    postcode: Faker::Address.postcode,
    price: (10..1000).to_a.sample,
    description: Faker::Coffee.notes,
    user: User.all.sample,
    wifi: [true, false].sample,
    kitchen: [true, false].sample,
    bathroom: [true, false].sample,
    air_defense: [true, false].sample,
    dog_friendly: [true, false].sample,
    number_beds: (1..5).to_a.sample
  )
  property.save
end

puts "new properties created"


20.times do
  start_date = Faker::Date.between(from: '2021-08-25', to: '2022-01-01')
  end_date = start_date + (1..14).to_a.sample
  booking = Booking.new(
    property: Property.all.sample,
    user: User.all.sample,
    rating: (1..5).to_a.sample,
    start_date: start_date,
    end_date: end_date
  )
  booking.save
end

puts "new bookings created"
