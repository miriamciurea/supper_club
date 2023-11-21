# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."

# categories = ["chinese", "italian", "japanese", "french", "belgian"]


10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  price_array = []
  x = 30
  15.times do
    price_array << x
    x += 5
  end
  capacity_array = []
    y = 10
  20.times do
    capacity_array << y
    y += 5
  end
  5.times do
    event = Event.new(
      venue: Faker::Restaurant.name,
      menu: Faker::Lorem.paragraph(sentence_count: 5),
      cuisine: Faker::Restaurant.type,
      price: price_array.sample,
      description: Faker::Restaurant.description,
      capacity: capacity_array.sample,
      date: Faker::Date.forward(from: ::Date.today, days: 365)
    )
    event.user = user
    event.save!
  end
end

20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# user_id_array =[]
# n = 1
# 19.times do
#   user_id_array << n
#   n += 1
# end

# puts user_id_array

# price_array = []
# x = 30
# 15.times do
#   price_array << x
#   x += 5
# end

# capacity_array = []
# y = 10
# 20.times do
#   capacity_array << y
#   y += 5
# end

# 8.times do
#   Event.create!(
#     # user_id: User.all.sample(:id),
#     user_id: user_id_array.sample,
#     venue: Faker::Restaurant.name,
#     menu: Faker::Lorem.paragraph(sentence_count: 5),
#     cuisine: Faker::Restaurant.type,
#     price: price_array.sample,
#     description: Faker::Restaurant.description,
#     capacity: capacity_array.sample,
#     date: Faker::Date.forward(from: ::Date.today, days: 365)
#   )
# end

puts "Finished!"
