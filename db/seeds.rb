require 'faker'

puts "1️⃣  First things first ... 🧽 Cleaning database 🫧 ..."
Message.destroy_all
ListRecommendation.destroy_all
Recommendation.destroy_all
List.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all

# CREATING USERS

puts '... 💥 Creating fake users ...'
10.times do
  name = Faker::TvShows::GameOfThrones.character
  nickname = Faker::TvShows::SouthPark.character

  User.create!(
    email: "#{Faker::TvShows::GameOfThrones.character.split.first}@gmail.com",
    password: "000000",
    password_confirmation: "000000",
    first_name: name.split(" ").first,
    last_name: name.split(" ").last,
    nickname: nickname.split(" ").first
  )
end

puts '✔️ Successfully created Users! 👤 '


#CREATING CATEGORIES

puts '... 💥 Creating fake categories ... '
categories = ["Movie", "Documentary", "Animation", "Comic Book", "Music", "Book", "Graphic Novel", "App","Videogame", "Podcast", "TV Show", "Youtube Channel"]

genre = ["Horror"]

# TO-DO: FIX THIS GENRES LATER:
# genre = [
#   "Action", "Comedy", "Drama", "Sci-Fi", "Horror","Romance", "Thriller", "Adventure", "Fantasy", "Mystery", "Pop", "Rock", "Hip-Hop", "Jazz", "Electronic","Country", "Classical", "R&B", "Indie", "Reggae", "Superhero", "Fantasy", "Horror", "Mystery", "Sci-Fi", "Romance", "Adventure", "Crime", "Historical", "Thriller", "Productivity", "Social Networking", "Entertainment", "Education", "Health & Fitness", "Travel", "News", "Photography", "Finance", "Gaming"
# ]

categories.each do |category|
  Category.create(name: category)
end

puts '✔️ Successfully created Categories! 🏷️ '


# CREATING ITEMS

puts '... 💥 Creating fake items...'

categories = Category.all

TODO - Create specific genres for each one of the categories.

movie_genre = [
  "Action", "Comedy", "Drama", "Sci-Fi", "Horror",
  "Romance", "Thriller", "Adventure", "Fantasy", "Mystery"
]

podcast_genre = [
  "True Crime", "Comedy", "News", "Interview", "Education",
  "Technology", "History", "Health", "Storytelling", "Music"
]

music_genre = [
  "Pop", "Rock", "Hip-Hop", "Jazz", "Electronic",
  "Country", "Classical", "R&B", "Indie", "Reggae"
]

youtube_genre = [
  "Gaming", "Cooking", "Travel", "Beauty", "Science",
  "DIY", "Fashion", "Fitness", "Comedy", "Music"
]

videogame_genre = [
  "RPG", "FPS", "Adventure", "Puzzle", "Simulation",
  "Racing", "Sports", "Strategy", "Fighting", "Horror"
]

animation_genre = [
  "Anime", "Cartoon", "Stop-Motion", "3D Animation", "Fantasy",
  "Sci-Fi", "Comedy", "Drama", "Adventure", "Musical"
]

graphic_novel_genre = [
  "Superhero", "Fantasy", "Horror", "Mystery", "Sci-Fi",
  "Romance", "Adventure", "Crime", "Historical", "Thriller"
]

tv_show_genre = [
  "Drama", "Comedy", "Crime", "Fantasy", "Sci-Fi",
  "Thriller", "Mystery", "Romance", "Horror", "Documentary"
]

documentary_genre = [
  "Nature", "History", "Science", "True Crime", "Social Issues",
  "Biography", "Travel", "Music", "Technology", "Sports"
]

app_genre = [
  "Productivity", "Social Networking", "Entertainment", "Education", "Health & Fitness",
  "Travel", "News", "Photography", "Finance", "Gaming"
]

categories.each do |category|
  5.times do
    case category.name
    when "Book"
      Item.create(
        category: category,
        title: Faker::Book.title,
        genre: Faker::Book.genre,
        # genre: Faker::Book.book_genre.select.random,
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
    when "Videogame"
      Item.create(
        category: category,
        title: Faker::Game.title,
        genre: Faker::Game.genre,
        description: Faker::Lorem.paragraph,
        author: Faker::Book.publisher,
        release_date: Faker::Date.between(from: '2000-01-01', to: '2023-08-29'),
        episode: rand(1..10)
      )
    when ["Podcast", "TV Show", "Youtube Channel"].include?(category.name)
      Item.create(
        category: category,
        title: Faker::TvShows::Simpsons.character,
        genre: Books::TheKingkillerChronicle.location,
        description: Faker::Lorem.paragraph,
        author: Faker::TvShows::Simpsons.character,
        release_date: Faker::Date.between(from: '2000-01-01', to: '2023-08-29'),
        episode: rand(1..10)
      )
    end
  end
end

puts '✔️ Successfully created Items! 📚 '

# CREATING RECOMMENDATIONS

puts '... 💥 Creating fake recommendations'
100.times do
  Recommendation.create(
    comment: Faker::Quote.yoda,
    giver: User.all.sample,
    receiver: User.all.sample,
    item: Item.all.sample
  )
end

puts '✔️ Successfully created Recommendations! 🎗️ '

# CREATING MESSAGES
puts '... Creating fake messages...'
recommendations = Recommendation.all

recommendations.each do |recommendation|
  Message.create(
    user: User.all.sample,
    recommendation: recommendation
  )
end

puts '✔️ Successfully created Messages! 💬 '
