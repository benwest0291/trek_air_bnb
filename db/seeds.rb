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
  address: "Buckingham Palace, Westminster, London",
  postcode: "SW1A 1AA",
  price: (10_000..100_000).to_a.sample,
  description: 'Buckingham Palace is the London residence and administrative headquarters of the monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality.',
  image_url: 'https://cdn.londonandpartners.com/asset/buckingham-palace-buckingham-palace-photographer-andrew-holt-ba2d2924f687e5713154dbf611c103e1.jpg',
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
  address: "1600 Pennsylvania Avenue NW, Washington, D.C.",
  postcode: "20500",
  price: (10_000..100_000).to_a.sample,
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

downing = Property.new(
  name: "10 Downing Street",
  address: "10 Downing Street, London",
  postcode: "SW1A 2AB",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/1/13/10_Downing_Street._MOD_45155532.jpg",
  price: (10_000..100_000).to_a.sample,
  description: "10 Downing Street in London, also known colloquially in the United Kingdom as Number 10, is the official residence and executive office of the Prime Minister of the United Kingdom.",
  user: User.all.sample,
  wifi: [true, false].sample,
  kitchen: [true, false].sample,
  bathroom: [true, false].sample,
  air_defense: [true, false].sample,
  dog_friendly: [true, false].sample,
  number_beds: (50..400).to_a.sample
  )
downing.save

leeds = Property.new(
  name: "Leeds Castle",
  address: "Broomfield, Maidstone",
  postcode: "ME17 1PL",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/0/05/Leeds_castle.JPG",
  price: (10_000..100_000).to_a.sample,
  description: "Leeds Castle is a castle in Kent, England, 5 miles (8 km) southeast of Maidstone. It is built on islands in a lake formed by the River Len to the east of the village of Leeds.",
  user: User.first,
  wifi: [true, false].sample,
  kitchen: [true, false].sample,
  bathroom: [true, false].sample,
  air_defense: [true, false].sample,
  dog_friendly: [true, false].sample,
  number_beds: (50..400).to_a.sample
)
leeds.save

penhurst = Property.new(
  name: "Penhurst Place",
  address: "Penshurst, Tonbridge",
  postcode: "TN11 8DG",
  image_url: "https://www.historichouses.org/app/uploads/2021/02/penshurst-place-730x385.jpg",
  price: (10_000..100_000).to_a.sample,
  description: "Penshurst Place is a historic building near Tonbridge, Kent, 32 miles south east of London, England. It is the ancestral home of the Sidney family, and was the birthplace of the great Elizabethan poet, courtier and soldier, Sir Philip Sidney.",
  user: User.all.sample,
  wifi: [true, false].sample,
  kitchen: [true, false].sample,
  bathroom: [true, false].sample,
  air_defense: [true, false].sample,
  dog_friendly: [true, false].sample,
  number_beds: (50..400).to_a.sample
)
penhurst.save

shard = Property.new(
  name: "The Shard",
  address: "32 London Bridge St, London",
  postcode: "SE1 9SG",
  image_url: "https://www.swedishnomad.com/wp-content/images/2020/03/The-Shard.jpg",
  price: (10_000..100_000).to_a.sample,
  description: "Penshurst Place is a historic building near Tonbridge, Kent, 32 miles south east of London, England. It is the ancestral home of the Sidney family, and was the birthplace of the great Elizabethan poet, courtier and soldier, Sir Philip Sidney.",
  user: User.all.sample,
  wifi: [true, false].sample,
  kitchen: [true, false].sample,
  bathroom: [true, false].sample,
  air_defense: [true, false].sample,
  dog_friendly: [true, false].sample,
  number_beds: (50..400).to_a.sample
)
shard.save

puts "new properties created"

2.times do
  start_date = Faker::Date.between(from: '2021-08-28', to: '2022-01-01')
  end_date = start_date + (1..14).to_a.sample
  booking = Booking.new(
    property: Property.all.sample,
    user: User.all.sample,
    start_date: start_date,
    end_date: end_date
  )
  booking.save
end

puts "new bookings created"
