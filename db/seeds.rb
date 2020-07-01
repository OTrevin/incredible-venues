# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Users"
User.destroy_all

10.times do
    User.create!(
    first_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    last_name: Faker::Name.last_name
    )
end

puts "Creating Venues"
Venue.destroy_all

9.times do
  Venue.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentences(number: 1),
    capacity: rand(10..100),
    price_per_day: Faker::Commerce.price,
    user_id: User.all.ids.sample)
end

puts "Done"
