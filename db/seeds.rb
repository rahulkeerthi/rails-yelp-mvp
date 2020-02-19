# require_relative '../app/models/restaurant'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
#   category = ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
#   Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number, category: category)
# end

30.times do
  restaurant_id = [1, 2, 3, 4, 5].sample
  rating = [0, 1, 2, 3, 4, 5].sample
  Review.create!(restaurant_id: restaurant_id, content: Faker::Restaurant.review, rating: rating)
end
