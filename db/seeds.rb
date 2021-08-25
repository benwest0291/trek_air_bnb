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

emails = ['phenela.luengo@gmail.com', 'hester25194@gmail.com', 'chi.ferr.1188@gmail.com', 'benwest0291@outlook.com']
emails.each do |email|
  user = User.new(
    email: email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Team.name.strip,
    address: Faker::Address.full_address,
    postcode: Faker::Address.postcode,
    password: "password"
  )
  user.save
end

puts "new users created"

buckingham = Property.new(
  name: "Buckingham Palace",
  address: "Westminster, London",
  postcode: "SW1A 1AA",
  price: 100000,
  description: 'Buckingham Palace is the London residence and administrative headquarters of the monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality.',
  image_url: 'https://cdn.londonandpartners.com/-/media/images/london/visit/whats-on/event-pages/buckinghampalace1920x1080.jpg?mw=640&hash=40096BE681415B8B7AAB77D542F889D7E174DBBC',
  user: User.all.sample,
  wifi: [true, false].sample,
  kitchen: [true, false].sample,
  bathroom: [true, false].sample,
  air_defense: [true, false].sample,
  dog_friendly: [true, false].sample,
  number_beds: 755
)
buckingham.save

white = Property.new(
  name: "White House",
  address: "	1600 Pennsylvania Avenue NW, Washington, D.C.",
  postcode: "20500",
  price: 950000,
  description: 'The White House is the official residence and workplace of the president of the United States.',
  image_url: 'https://www.thoughtco.com/thmb/Uyn9K1t-HCB2Lr7WJVMaBEa7RUI=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/WhiteHouse-9a73875f70db4451b7c8c88175accc04.jpg',
  user: User.all.sample,
  wifi: [true, false].sample,
  kitchen: [true, false].sample,
  bathroom: [true, false].sample,
  air_defense: [true, false].sample,
  dog_friendly: [true, false].sample,
  number_beds: 132
)
white.save

100.times do
  property = Property.new(
    name: Faker::Nation.capital_city,
    address: Faker::Address.full_address,
    postcode: Faker::Address.postcode,
    image_url: Faker::Placeholdit.image,
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
