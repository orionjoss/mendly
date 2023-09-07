require 'faker'

puts "🧹 Cleaning database..."
Message.destroy_all
Chatroom.destroy_all
ListRecommendation.destroy_all
Recommendation.destroy_all
List.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all


puts '...Creating fake users...'

User.create!(
  email: "mandy@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Mandy",
  last_name: "Lee",
  nickname: "Mandy Lee (AI librarian)"
)

User.create!(
  email: "orion@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Orion",
  last_name: "Joss",
  nickname: "Orion Joss"
)

User.create!(
  email: "jorge@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Jorge",
  last_name: "Marques",
  nickname: "Jorge Marques"
)

User.create!(
  email: "hugo@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Hugo",
  last_name: "Pereira",
  nickname: "Hugo Pereira"
)

User.create!(
  email: "sofia@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Sofia",
  last_name: "Laurentino",
  nickname: "Sofia Lauren"
)

User.create!(
  email: "thomas@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Thomas",
  last_name: "Ayala",
  nickname: "Tom Aya"
)

User.create!(
  email: "joan@gmail.com",
  password: "000000",
  password_confirmation: "000000",
  first_name: "Joan",
  last_name: "Baez",
  nickname: "Joan Baez"
)

puts ' ✔️ Successfully created ===> Users'

puts '...Creating fake categories... '
categories = ["Movie", "Documentary", "Animation", "Comic Book", "Music", "Book", "Graphic Novel", "App","Videogame", "Podcast", "TV Show", "Youtube Channel"]

genre = ["Horror"]

categories.each do |category|
  Category.create(name: category)
end

puts ' ✔️ Successfully created ===> Categories'

puts '...Creating fake items...'

categories = Category.all

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
    case category.name
    when "Movie"
      Item.create(
        category: category,
        title: "Interstellar",
        genre: "Sci-fi",
        description: "Interstellar is a 2014 science fiction film directed by Christopher Nolan. The story follows a group of astronauts led by Joseph Cooper, played by Matthew McConaughey, on a journey through a wormhole near Saturn in search of a new habitable planet for humanity. The film explores complex themes of time dilation, love, and human survival in the face of environmental catastrophe. Interstellar is known for its stunning visual effects, emotional depth, and thought-provoking exploration of theoretical physics.",
        author: "Christopher Nolan",
        release_date: "09-11-2014"
      )

      Item.create(
        category: category,
        title: "Arrival",
        genre: "Sci-fi/Drama",
        description: "Directed by Denis Villeneuve, Arrival is based on the short story 'Story of Your Life' by Ted Chiang. The film follows linguist Louise Banks (played by Amy Adams) as she attempts to communicate with mysterious extraterrestrial visitors who have arrived on Earth. The story delves into language, time, and the nature of human perception in the face of the unknown.",
        author: "Denis Villeneuve",
        release_date: "11-11-2016"
      )

      Item.create(
        category: category,
        title: "The Martian",
        genre: "Sci-fi/Drama",
        description: "Directed by Ridley Scott, The Martian is based on the novel by Andy Weir. It tells the story of Mark Watney (played by Matt Damon), an astronaut who is left stranded on Mars by his crew, and his fight for survival as he attempts to find a way back to Earth. The film combines elements of science, humor, and suspense.",
        author: "Ridley Scott",
        release_date: "09-30-2015"
      )

      Item.create(
        category: category,
        title: "Dune",
        genre: "Sci-fi",
        description: "'Dune' is a science fiction novel written by Frank Herbert. Set in a distant future amidst a feudal interstellar society, the story follows the young Paul Atreides as his family assumes control of the desert planet Arrakis, the only known source of the spice melange. The novel explores themes of power, religion, and ecology in a richly imagined universe.",
        author: "Frank Herbert",
        release_date: "06-05-1965"
      )

    when "Book"

      Item.create(
        category: category,
        title: "Neuromancer",
        genre: "Sci-fi",
        description: "'Neuromancer' by William Gibson is a cyberpunk classic. The novel follows Case, a washed-up computer hacker hired for one last job in cyberspace. Set in a gritty, dystopian future, it explores themes of artificial intelligence, virtual reality, and the merging of technology and humanity.",
        author: "William Gibson",
        release_date: "07-01-1984"
      )

      Item.create(
        category: category,
        title: "Foundation",
        genre: "Sci-fi",
        description: "'Foundation' is a science fiction novel by Isaac Asimov, the first book in the Foundation series. It depicts the fall of a Galactic Empire and the efforts of mathematician Hari Seldon to shorten the ensuing dark age. Asimov's work explores themes of psychohistory, predicting the future through mathematical models.",
        author: "Isaac Asimov",
        release_date: "05-01-1951"
      )

    when "Videogame"

      Item.create(
        category: category,
        title: "Limbo",
        genre: "Sci-fi/Puzzle Platformer",
        description: "'Limbo' is a critically acclaimed puzzle-platformer developed by Playdead. Set in a dark and atmospheric world, players control a nameless boy on a journey through a treacherous environment filled with traps and hazards. The game is known for its haunting art style, atmospheric sound design, and clever puzzle mechanics.",
        author: "Playdead",
        release_date: "07-21-2010"
      )

      Item.create(
        category: category,
        title: "Deus Ex",
        genre: "Sci-fi/Action RPG",
        description: "'Deus Ex' is a cyberpunk-themed action RPG developed by Ion Storm. Set in a world rife with conspiracies and technological advancements, players take on the role of JC Denton, an augmented agent navigating complex moral dilemmas. The game is celebrated for its deep narrative, player choice, and blending of multiple gameplay styles.",
        author: "Ion Storm",
        release_date: "06-26-2000"
      )

      Item.create(
        category: category,
        title: "Mass Effect 2",
        genre: "Sci-fi/RPG",
        description: "'Mass Effect 2' is a critically acclaimed sci-fi RPG developed by BioWare. Set in a richly detailed galaxy, players take on the role of Commander Shepard, tasked with assembling a diverse team to combat an impending extraterrestrial threat. The game is known for its deep storytelling, engaging characters, and branching narrative choices.",
        author: "BioWare",
        release_date: "01-26-2010"
      )

    when "Podcast"

      Item.create(
        category: category,
        title: "Freakonomics Radio",
        genre: "Behavioral Economics",
        description: "'Freakonomics Radio' is a popular podcast hosted by Stephen J. Dubner, co-author of the best-selling book 'Freakonomics'. The podcast explores the hidden side of everyday life and delves into the economic forces that shape our behavior. It covers a wide range of topics related to behavioral economics, social incentives, and human decision-making.",
        author: "Stephen J. Dubner",
        release_date: "04-17-2010"
      )

      Item.create(
        category: category,
        title: "The Hidden Brain",
        genre: "Behavioral Economics",
        description: "'The Hidden Brain' is a thought-provoking podcast hosted by Shankar Vedantam. It combines insights from social science research with real-world stories to explore the unconscious patterns that influence human behavior. The podcast often covers topics related to behavioral economics, cognitive biases, and the psychology of decision-making.",
        author: "Shankar Vedantam",
        release_date: "09-22-2015"
      )

      Item.create(
        category: category,
        title: "Choiceology with Katy Milkman",
        genre: "Behavioral Economics",
        description: "'Choiceology' is a podcast hosted by Katy Milkman, a professor at the Wharton School. The show explores the behavioral science behind decision-making and the factors that influence our choices. Each episode features compelling stories and expert insights to illustrate concepts in behavioral economics.",
        author: "Katy Milkman",
        release_date: "02-13-2018"
      )

    when "Comic Book"

      Item.create(
        category: category,
        title: "Sandman",
        genre: "Fantasy",
        description: "'Sandman' is a critically acclaimed comic series written by Neil Gaiman, with art by various artists including Sam Kieth and Mike Dringenberg. It follows the Endless, a family of powerful beings, with Dream (Morpheus) as the central character. The series delves into mythology, dreams, and the nature of reality.",
        author: "Neil Gaiman, Sam Kieth, Mike Dringenberg",
        release_date: "1989-1996"
      )

      Item.create(
        category: category,
        title: "Saga",
        genre: "Sci-fi/Fantasy",
        description: "'Saga' is a sci-fi/fantasy comic series created by writer Brian K. Vaughan and artist Fiona Staples. It follows the journey of Alana and Marko, lovers from warring planets, as they navigate a galaxy filled with danger and magic. The series explores themes of love, family, and the impact of war on individuals.",
        author: "Brian K. Vaughan, Fiona Staples",
        release_date: "2012-present"
      )

      Item.create(
        category: category,
        title: "Y: The Last Man",
        genre: "Sci-fi/Dystopian",
        description: "'Y: The Last Man' is a sci-fi/dystopian comic series by Brian K. Vaughan and Pia Guerra. It explores a world where all males, except for one man and his pet monkey, have mysteriously died. The series follows their journey in a world now dominated by women. It delves into themes of gender, society, and survival.",
        author: "Brian K. Vaughan, Pia Guerra",
        release_date: "2002-2008"
      )

    end
  end

categories.each do |category|
  3.times do
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

puts ' ✔️ Successfully created ===> Items'

puts '...Creating fake recommendations...'
30.times do
  Recommendation.create(
    comment: Faker::Quote.yoda,
    giver: User.all.sample,
    receiver: User.all.sample,
    item: Item.all.sample
  )
end

puts ' ✔️ Successfully created ===> Recommendations '

puts '...Creating chatroom...'
Chatroom.create(
  name: "AI Library Assistant"
)

puts ' ✔️ Successfully created ===> Chatroom'

puts '... Creating AI welcome messages...'
recommendations = Recommendation.all
  recommendation = recommendations.sample
  chatroom = Chatroom.first

  message = Message.create(
    gpt_response: "👋 Hi, I'm Mandy Lee, your personal AI Librarian.",
    recommendation_id: recommendation.id,
    user: User.first,
    chatroom: chatroom
  )
  message = Message.create(
    gpt_response: "I can add and retrieve items from your personal media library to make sure you will always have the recommendations from your friends at hand. 🎥🍿",
    recommendation_id: recommendation.id,
    user: User.all.sample,
    chatroom: chatroom
  )

  message = Message.create(
    gpt_response: "Here are some shortcuts to help you save time:
    \r\n 👉 '#' for | Media category |
    \r\n 👉 ':' for | Title of your item |
    \r\n 👉 '@' for | Recommender |
    \r\n 👉 '/' for your | Personal note |",
    recommendation_id: recommendation.id,
    user: User.all.sample,
    chatroom: chatroom
  )

  message = Message.create(
    gpt_response: "For example, you can save a recommendation by typing: #movie :Inside Out @jorge /Animation to understand how our emotions and memory works",
    recommendation_id: recommendation.id,
    user: User.all.sample,
    chatroom: chatroom
  )

  # message.update(gpt_response: text)

puts ' ✔️ Successfully created ===> Messages'
