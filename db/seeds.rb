require "faker"
require "json"
require "open-uri"

puts "Cleaning database..."
User.destroy_all
Event.destroy_all
puts "Creating users and events..."

meals_array = []

100.times do
  filepath = "https://www.themealdb.com/api/json/v1/1/random.php"
  serialized_meal = URI.open(filepath).read
  meal = JSON.parse(serialized_meal)
  meals_hash = meal["meals"]
  random_meal = meals_hash[0]["strMeal"]
  meals_array << random_meal
end

cuisines = ["Indian", "Chinese", "Japanese", "Thai", "Brittish", "French", "Italian", "Fillipino", "Scandinavian", "Ethiopian", "Mexican", "Venezuelan", "Spanish", "Sichuan", "Turkish", "Korean", "Mediterranean", "Cantonese", "Vietnamese"]
venues = ["Gosnells Taproom", "Chef's Home!", "The Five Points Brewing Co", "The William IV", "Ricco's Lounge", "Kitchen Theory", "Gaucho", "Only Food And Courses", "Downhills Park Cafe", "Facing Heaven", "Secret Location"]
descriptions = ["If you’re looking for a supper club stalwart, look no further than Dinner Ladies. This dynamic London-based supper club offers seasonal food that’s both delicious and different. These trained chefs serve food from across the globe; their inspiration derives from their experiences teaching cookery in Asia, as well as extensive worldwide travel.", "Italian Supper Club owners Toto and Silvio are bringing the Italian tradition of long, relaxed and ruddy delicious dining to London. Combining the founders’ fondest food and drink memories of both Italy and London, Italian Supper Club’s menu is full of great seasonal food, moreish wine from small family-run vineyards and a unique vibe that only Londoners can bring - open-minded, eager exploration of new things.", "Smoke & Salt are the epitome of fresh, seasonal British cuisine with a delightful sprinkle of London’s diverse international culture. Their small and experienced team have created a menu where flavour takes centre stage with the help of ancient culinary techniques of smoking, curing and preserving.", "Described by The Evening Standard as 'Michelin quality without the stuffiness' The Waterhouse Project offers a fantastic 8-course seasonal tasting menu with 5 glasses of paired wines and an aperitif. Each course is greeted with a short introduction by the chef, Gabriel, and carefully paired by sommelier Jonny who is currently training to be a master of wine. This is truly a supper club to impress", "Adding a pinch of salt to every dish uplifts the flavour - and this is exactly what Salty Studio will do for your event! Their supper clubs revolve around the idea that if you combine all five senses to tell an experiential food story, you won’t forget it - these guys really know how to set a scene.", "Eleven98 kick off proceedings with a punchy cocktail before your guests settle down to take a pew and delve into a sequence of six carefully curated tasting courses. Everything on Eleven98's menu comes from Hackney, the borough in which chef Aidan Brooks was born and bred.",
  "A surefire supper club hit, The Kochi Kitchen creates unique dining experiences inspired Kerala, South India. The aim of The Kochi Kitchen is to always bring vibrancy, variety and unbelievable flavours to your plate.", "Over at Party N Paint, you'll get to dig into a two course meal, which includes a tasty bento box and a chocolate brownie with ice cream. You'll be able to wash it down with bottomless rum punch before moving on to the highlight of the night, the boozy art class."]

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

4.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  2.times do
    event = Event.new(
      venue: venues.sample,
      menu: meals_array.sample(5),
      cuisine: cuisines.sample(),
      price: price_array.sample,
      description: descriptions.sample,
      capacity: capacity_array.sample,
      date: Faker::Date.forward(from: ::Date.today, days: 365)
    )
    event.user = user
    event.save!
  end
end

24.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

puts "Finished!"
