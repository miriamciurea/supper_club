require "faker"
require "json"
require "open-uri"

# Data for presentation

puts "Cleaning database..."
User.destroy_all
Event.destroy_all
puts "Creating users and events..."

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

# User 1

user = User.new(
  first_name: "Marco",
  last_name: "Pierre-White",
  email: "Marco@lewagon.com",
  password: "123456"
)
user.save!
event = Event.new(
  venue: "The view from the shard",
  menu: "Steak and Kidney Pie, Roast Beef and Yorshire Pudding, Apple Pie",
  cuisine: "British",
  price: price_array.sample,
  description: "British cuisine-themed supper club curated by Marco Pierre White will promise an unforgettable gastronomic journey, showcasing the chef's mastery in reinventing traditional British dishes while preserving their essence and celebrating the best of British flavors.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://photo-cms-vovworld.zadn.vn/w500/Uploaded/vovworld/vowklqmx/2020_03_13/sundayroast_LMCS.jpg')
event.photos.attach(io: photo, filename: 'Roast-Beef.jpg', content_type: 'img/jpg')
photo = URI.open('https://static01.nyt.com/images/2021/11/17/dining/12BestPie3/12BestPie3-articleLarge-v2.jpg?w=1280&q=75')
event.photos.attach(io: photo, filename: 'Apple-Pie.jpg', content_type: 'img/jpg')
event.user = user
event.save!
event = Event.new(
  venue: "OXO2",
  menu: "Beef Tartare, Ratatouille, Creme Brulee",
  cuisine: "French",
  price: price_array.sample,
  description: "French cuisine-themed supper club by Marco Pierre White at OXO2 will promise an unforgettable evening, marrying the finesse of French culinary tradition with the chef's innovation and artistry, all set against the backdrop of a sophisticated and iconic London venue.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://assets.bonappetit.com/photos/57ad5283f1c801a1038bcb7f/master/pass/beef-tartare-with-cherry-peppers.jpg')
event.photos.attach(io: photo, filename: 'Beef-Tartare.jpg', content_type: 'img/jpg')
photo = URI.open('https://www.mashed.com/img/gallery/disney-ratatouille/intro-1620047814.jpg')
event.photos.attach(io: photo, filename: 'Ratatouille.jpg', content_type: 'img/jpg')
photo = URI.open('https://i0.wp.com/www.onceuponachef.com/images/2023/02/Creme-brulee-1.jpg?resize=760%2C516&ssl=1')
event.photos.attach(io: photo, filename: 'Creme-Brulee.jpg', content_type: 'img/jpg')
event.user = user
event.save!

# User 2

user = User.new(
  first_name: "Jamie",
  last_name: "Oliver",
  email: "Oliver@lewagon.com",
  password: "123456"
)
user.save!
event = Event.new(
  venue: "The view from the shard",
  menu: "Steak and Kidney Pie, Roast Beef and Yorshire Pudding, Apple Pie",
  cuisine: "British",
  price: price_array.sample,
  description: "British cuisine-themed supper club curated by Marco Pierre White will promise an unforgettable gastronomic journey, showcasing the chef's mastery in reinventing traditional British dishes while preserving their essence and celebrating the best of British flavors.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://photo-cms-vovworld.zadn.vn/w500/Uploaded/vovworld/vowklqmx/2020_03_13/sundayroast_LMCS.jpg')
event.photos.attach(io: photo, filename: 'Roast-Beef.jpg', content_type: 'img/jpg')
photo = URI.open('https://static01.nyt.com/images/2021/11/17/dining/12BestPie3/12BestPie3-articleLarge-v2.jpg?w=1280&q=75')
event.photos.attach(io: photo, filename: 'Apple-Pie.jpg', content_type: 'img/jpg')
event.user = user
event.save!
event = Event.new(
  venue: "Borough Market",
  menu: "Chaat Samosa, Chicken Tikka Masala, Gulab Jamun",
  cuisine: "Indian",
  price: price_array.sample,
  description: "A supper club curated by Jamie Oliver, showcasing Indian cuisine at Borough Market, will be a vibrant, flavorful, and communal dining experience that blends the authenticity of Indian flavors with Jamie Oliver's creative touch and commitment to fresh, quality ingredients.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://assets.bonappetit.com/photos/57ad5283f1c801a1038bcb7f/master/pass/beef-tartare-with-cherry-peppers.jpg')
event.photos.attach(io: photo, filename: 'Beef-Tartare.jpg', content_type: 'img/jpg')
photo = URI.open('https://www.mashed.com/img/gallery/disney-ratatouille/intro-1620047814.jpg')
event.photos.attach(io: photo, filename: 'Ratatouille.jpg', content_type: 'img/jpg')
photo = URI.open('https://i0.wp.com/www.onceuponachef.com/images/2023/02/Creme-brulee-1.jpg?resize=760%2C516&ssl=1')
event.photos.attach(io: photo, filename: 'Creme-Brulee.jpg', content_type: 'img/jpg')
event.user = user
event.save!

puts "Finished!"
