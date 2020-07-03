# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Venue.destroy_all

User.destroy_all

puts "Creating Users"

User.create!(
    first_name: "John",
    email: "john@gmail.com",
    password: 123456,
    last_name: "Magic"
    )

User.create!(
    first_name: "Chris",
    email: "chris@gmail.com",
    password: 123456,
    last_name: "Expert"
    )

puts "Creating Venues"

Venue.create!(
  name: "The Woods",
  address: "214 South Bridge Rd, Singapore 058763",
  description: "Event place, Meeting Room, Studio, Unique",
  capacity: 20,
  price_per_day: 550,
  user_id: User.all.ids.sample
)

Venue.create!(
  name: "The Float@Marina Bay",
  address: "20 Raffles Ave. Singapore 039805",
  description: "Great place in marina bay Singapore",
  capacity: 500,
  price_per_day: 1000,
  user_id: User.all.ids.sample
)


Venue.create!(
  name: "Cloud9 Events",
  address: "200 South Bridge Rd, Singapore 058763",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room, Studio, Training Room, Unique Venue, Warehouse",
  capacity: 100,
  price_per_day: 400,
  user_id: User.all.ids.sample
)

Venue.create!(
  name: "Three Degree Cafe",
  address: "11 Slim Barracks Rise, 03, Singapore 138664",
  description: "Cafe, Event Space, Halal Venue",
  capacity: 100,
  price_per_day: 400,
  user_id: User.all.ids.sample
)

Venue.create!(
  name: "Cloud9 Events",
  address: "65 Ubi Rd 1, #02-97, Singapore 408729",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room",
  capacity: 50,
  price_per_day: 350,
  user_id: User.all.ids.sample
)

Venue.create!(
  name: "Here.SG",
  address: "65 Ubi Rd 1, #02-97, Singapore 408729",
  description: "Event Space, Function Hall, Kids & Recreational, Meeting Room",
  capacity: 50,
  price_per_day: 350,
  user_id: User.all.ids.sample
)

Venue.create!(
  name: "Party time baby",
  address: "400 Orchard Rd, Singapore 238875",
  description: "Meeting Room, Karaoke, massage",
  capacity: 100,
  price_per_day: 550,
  user_id: User.all.ids.sample
)

Venue.create!(
  name: "Heroes",
  address: "200 Middle Rd, Singapore 188980",
  description: "Bar, Cafe, Event Space, Function Hall",
  capacity: 20,
  price_per_day: 250,
  user_id: User.all.ids.sample
)



# puts "Attaching pictures..."

# file = URI.open('https://s3-production.venuerific.com/shrine/venuephotos/23681/into-the-woods-21st-birthday-party-venues-singapore-venuerific-large.jpg')
# # venue = Venue.new(title: 'NES', body: "A great console")
# Venue.photos.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')

puts "Creating Amenities"
  Amenity.create!(name: "wifi")
  Amenity.create!(name: "air_conditioning")
  Amenity.create!(name: "kitchen")

puts "Done"
