# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

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






url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s"
cocktail_serialized = open(url).read
cocktail = JSON.parse(cocktail_serialized)

puts "Creating Venues"
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all
id = 0

9.times do 
  Cocktail.create!(name: cocktail["drinks"][id]["strDrink"],
  picurl: cocktail["drinks"][id]["strDrinkThumb"])
  Ingredient.create!(name: cocktail["drinks"][id]["strIngredient1"] )
  id += 1
end