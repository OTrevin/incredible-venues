# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Venue.destroy_all

User.destroy_all

puts "Creating Users"

User.create!(
    first_name: "John",
    email: "john@gmail.com",
    password: 123456,
    last_name: "Faker"
    )

puts "Creating Venues"

Venue.create!(
  name: "The Float@Marina Bay",
  address: "20 Raffles Ave. Singapore 039805",
  description: "Great place in marina bay Singapore",
  capacity: 9000,
  price_per_day: 9000,
  user_id: User.all.ids.sample

)

puts "Creating Amenities"
  Amenity.create!(name: "wifi")
  Amenity.create!(name: "air_conditioning")
  Amenity.create!(name: "kitchen")

puts "Done"
