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
  venue: "Battersea Arts Centre",
  menu: "Tom Yum Soup, Pad Thai, Sticky Rice with Mango",
  cuisine: "Thai",
  price: price_array.sample,
  description: "Jamie Oliver's Thai cuisine-themed supper club at Battersea Arts Centre will promise an innovative fusion of Thai culinary traditions, artistic ambiance, and Jamie's inventive flair, creating a one-of-a-kind dining affair that tantalizes the senses and celebrates the diversity of Thai flavors.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://img.taste.com.au/jgHrD_eG/w720-h480-cfill-q80/taste/2021/02/10-minute-vegetarian-pad-thai-168946-2.jpg')
event.photos.attach(io: photo, filename: 'Pad-Thai.jpg', content_type: 'img/jpg')
photo = URI.open('https://omnivorescookbook.com/wp-content/uploads/2023/06/230619_Mango-Coconut-Rice_550.jpg')
event.photos.attach(io: photo, filename: 'Sticky-Rice-with-Mango.jpg', content_type: 'img/jpg')
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
photo = URI.open('https://images.immediate.co.uk/production/volatile/sites/30/2023/02/Samosa-chaat-fa816d1.jpg?quality=90&resize=556,505')
event.photos.attach(io: photo, filename: 'Chaat-Samosa.jpg', content_type: 'img/jpg')
photo = URI.open('https://c.ndtvimg.com/2022-07/33meqsb_chicken-tikka_625x300_08_July_22.png')
event.photos.attach(io: photo, filename: 'Chicken-Tikka-Masala.jpg', content_type: 'img/png')
photo = URI.open('https://static01.nyt.com/images/2023/10/19/multimedia/ND-Gulab-Jamun-tqgl/ND-Gulab-Jamun-tqgl-articleLarge.jpg')
event.photos.attach(io: photo, filename: 'Gulab-Juman.jpg', content_type: 'img/jpg')
event.user = user
event.save!

# User 3

user = User.new(
  first_name: "Wolfgang",
  last_name: "Puck",
  email: "Wolfgang@lewagon.com",
  password: "123456"
)
user.save!
event = Event.new(
  venue: "The Rooftop Terrace at Trafalgar St. James",
  menu: "Bruschetta, Osso Buco, Tiramisu",
  cuisine: "Italian",
  price: price_array.sample,
  description: "Wolfgang Puck's Italian cuisine-themed supper club at The Rooftop Terrace at Trafalgar St. James will promise a luxurious and refined culinary affair, blending the sophistication of Italian flavors, Wolfgang Puck's culinary innovation, and the stunning backdrop of London's skyline for an unforgettable dining experience.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://www.telegraph.co.uk/content/dam/Food%20and%20drink/scotchbeef/osso-buco-alamy.jpg?imwidth=680')
event.photos.attach(io: photo, filename: 'Osso-Buco.jpg', content_type: 'img/jpg')
photo = URI.open('https://static01.nyt.com/images/2017/04/05/dining/05COOKING-TIRAMISU1/05COOKING-TIRAMISU1-master768.jpg')
event.photos.attach(io: photo, filename: 'Tiramisu.jpg', content_type: 'img/jpg')
event.user = user
event.save!
event = Event.new(
  venue: "The Hurlingham Club",
  menu: "Sashimi Platter, Tonkotsu Ramen, Dorayaki",
  cuisine: "Japanese",
  price: price_array.sample,
  description: "
  A supper club orchestrated by Wolfgang Puck, featuring Japanese cuisine at The Hurlingham Club, will deliver an elegant and exclusive dining experience merging the precision of Japanese flavors with Wolfgang Puck's culinary artistry, set within the luxurious ambiance of The Hurlingham Club's refined surroundings.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://www.mashed.com/img/gallery/the-real-difference-between-sushi-and-sashimi/intro-1613076229.jpg')
event.photos.attach(io: photo, filename: 'Sashimi-Platter.jpg', content_type: 'img/jpg')
photo = URI.open('https://i1.wp.com/seonkyounglongest.com/wp-content/uploads/2020/09/Easy-Tonkotsu-26-mini.jpg?fit=1000%2C667&ssl=1')
event.photos.attach(io: photo, filename: 'Tonkotsu-Ramen.jpg', content_type: 'img/jpg')
photo = URI.open('https://i.pinimg.com/736x/86/83/e3/8683e3ccbd6e684d961a0bf9dcc3b26e.jpg')
event.photos.attach(io: photo, filename: 'Dorayaki.jpg', content_type: 'img/jpg')
event.user = user
event.save!

# User 4

user = User.new(
  first_name: "Nigella",
  last_name: "Lawson",
  email: "Nigella@lewagon.com",
  password: "123456"
)
user.save!
event = Event.new(
  venue: "The Vaults at Waterloo",
  menu: "Tacos al Pastor, Chiles Rellenos, Churros",
  cuisine: "Mexican",
  price: price_array.sample,
  description: "A supper club hosted by Nigella Lawson, showcasing Mexican cuisine at The Vaults at Waterloo, will be an immersive and vibrant dining experience that celebrates the bold and diverse flavors of Mexico, guided by Nigella Lawson's culinary expertise and flair, set within the unique and atmospheric backdrop of The Vaults.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://www.seriouseats.com/thmb/FxO0v2K8bEp8rhvMxuqmMCnhWcg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__images__2013__04__20130427-tacos-al-pastor-new-39-c85035f8465743729e61e16991821d14.jpg')
event.photos.attach(io: photo, filename: 'Tacos-al-Pastor.jpg', content_type: 'img/jpg')
photo = URI.open('https://www.tasteofhome.com/wp-content/uploads/2021/12/Chiles-Rellenos-FT_Ericka-Sanchez-for-Taste-of-Home.jpg?fit=680%2C454')
event.photos.attach(io: photo, filename: 'Chiles-Rellenos.jpg', content_type: 'img/jpg')
photo = URI.open('https://www.redpathsugar.com/sites/redpathsugar_com/files/styles/m/public/Churros_Dulce_de_Leche_500x400.jpg.webp?itok=1zmVpkTF')
event.photos.attach(io: photo, filename: 'Churros.jpg', content_type: 'img/jpg')
event.user = user
event.save!
event = Event.new(
  venue: "The Cinnamon Club",
  menu: "Falafel and Hummus, Moussaka, Baklava",
  cuisine: "Mediterranean",
  price: price_array.sample,
  description: "
  A supper club orchestrated by Wolfgang Puck, featuring Japanese cuisine at The Hurlingham Club, will deliver an elegant and exclusive dining experience merging the precision of Japanese flavors with Wolfgang Puck's culinary artistry, set within the luxurious ambiance of The Hurlingham Club's refined surroundings.",
  capacity: capacity_array.sample,
  date: Faker::Date.forward(from: Date.today, days: 365)
)
photo = URI.open('https://images.immediate.co.uk/production/volatile/sites/2/2019/06/Olive_VeggieMoussaka-b91289a.jpg?resize=768,574')
event.photos.attach(io: photo, filename: 'Moussaka.jpg', content_type: 'img/jpg')
photo = URI.open('https://www.yummytummyaarthi.com/wp-content/uploads/2015/07/Baklava-1.jpeg')
event.photos.attach(io: photo, filename: 'Baklava.jpg', content_type: 'img/jpg')
event.user = user
event.save!

puts "Finished!"
