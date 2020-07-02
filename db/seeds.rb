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

10.times do
    User.create!(
    first_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    last_name: Faker::Name.last_name
    )
end

puts "Creating Venues"

9.times do
  Venue.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentences(number: 1),
    capacity: rand(10..100),
    price_per_day: Faker::Commerce.price,
    user_id: User.all.ids.sample,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude)
end

puts "Creating Amenities"
  Venue_amenity.create!(name: "wifi")
  Venue_amenity.create!(name: "airconditioning")
  Venue_amenity.create!(name: "kitchen")
  
puts "Done"
