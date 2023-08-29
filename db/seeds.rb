require 'faker'

puts "Cleaning the database 🫧🧽 ..."
User.destroy_all
Recommendation.destroy_all
Item.destroy_all
Category.destroy_all
List.destroy_all
Message.destroy_all

# CREATING USERS

puts 'Creating 20 fake users'
20.times do
  user = User.new(
    first_name: Faker::TvShows::BreakingBad.character.split(" ").first,
    last_name: Faker::TvShows::GameOfThrones.character.split(" ").last,
    password: "111111"
  )

  user.nickname = user.first_name
  user.email = "#{user.first_name}@gmail.com"
  user.save
end

puts 'Users created Successfully, you are a rockstar!🤘🎸!'


#CREATING CATEGORIES

puts 'Creating categories '
categories = ["Film", "Documentary", "Animation", "Comic Book", "Music", "Book", "Graphic Novel", "Videogame", "Podcast", "TV Show", "Youtube Channel"]

categories.each do |category|
  Category.create(name: category)
end

puts 'CATEGORIES created Successfully, you are a rockstar!🤘🎸!'

# CREATING ITEMS

puts 'Creating 200 fake items'

200.times do
  category = Category.all.sample

  case category.name
  when "Book"
    Item.create(
      category: category,
      title: Faker::Book.title,
      genre: Faker::Book.genre,
      description: Faker::Lorem.paragraph,
      author: Faker::Book.author,
      release_date: Faker::Date.between(from: '2000-01-01', to: '2023-08-29')
    )
  when "Music"
    Item.create(
      category: category,
      title: Faker::Music.album,
      genre: Faker::Music.genre,
      description: Faker::Lorem.paragraph,
      author: Faker::Music.band,
      release_date: Faker::Date.between(from: '2000-01-01', to: '2023-08-29')
    )
  when "Videogames"
    Item.create(
      category: category,
      title: Faker::Game.title,
      genre: Faker::Game.genre,
      description: Faker::Lorem.paragraph,
      author: Faker::Game.publisher,
      release_date: Faker::Date.between(from: '2000-01-01', to: '2023-08-29'),
      episode: rand(1..10)
    )
  when ["Podcasts", "TV Shows", "Youtube Channel"].include?(category.name)
    Item.create(
      category: category,
      title: Faker::TvShows::Simpsons.character,
      genre: Faker::TvShows::Simpsons.location,
      description: Faker::Lorem.paragraph,
      author: Faker::TvShows::Simpsons.character,
      release_date: Faker::Date.between(from: '2000-01-01', to: '2023-08-29'),
      episode: rand(1..10)
    )
  end
end

puts 'Recommendations created Successfully, you are a rockstar!🤘🎸!'

# CREATING RECOMMENDATIONS

puts 'Creating 100 fake recommendations'
100.times do
  Recommendation.create(
    comment: Faker::Quote.yoda,
    giver: User.all.sample,
    receiver: User.all.sample,
    item: Item.all.sample
  )
end

puts 'Recommendations created Successfully, you are a rockstar!🤘🎸!'

# CREATING MESSAGES
