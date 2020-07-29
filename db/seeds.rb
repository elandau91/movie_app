# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "themoviedb"

# Tmdb::Api.key("a9906c88d9a679228d60881374c08beb")
# Tmdb::Api.language("en")

# def search (input)
#     @search = Tmdb::Search.new
#     @search.resource('movie') # determines type of resource
#     @search.query('input') # the query to search against
#     @movie = @search.fetch 

#     self.title = @movie[0]["original_title"]
#     self.poster =  @movie[0]["poster_path"]
#     self.release_date = @movie[0]["release_date"]
# end

#Access ID for faster referencing
# @movie[0]["id"]

# movie = Tmdb::Movie.detail(550)

# movie["original_title"]rrr

# # etc.



User.destroy_all
Movie.destroy_all
Review.destroy_all

5.times do
    User.create(name: Faker::FunnyName.name, username: Faker::Science.element)
end


m1 = Movie.new
m1.search(Faker::Movie.title)
m1.save

m2 = Movie.new
m2.search(Faker::Movie.title)
m2.save

m3 = Movie.new
m3.search(Faker::Movie.title)
m3.save

m4 = Movie.new
m4.search(Faker::Movie.title)
m4.save

m5 = Movie.new
m5.search(Faker::Movie.title)
m5.save



# Movie.create(title: Faker::Movie.title, release_date: Faker::Number.number(digits: 6)  , poster: Faker::Avatar.image )


20.times do
    Review.create(user_id: User.all.sample.id, movie_id: Movie.all.sample.id, rating: rand(1..10), content: Faker::Movie.quote, favorite: Faker::Boolean.boolean)
end

puts "done!"