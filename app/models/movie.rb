Tmdb::Api.key("a9906c88d9a679228d60881374c08beb")
Tmdb::Api.language("en")

class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews


    def search (input)
        @search = Tmdb::Search.new
        @search.resource('movie') 
        @search.query(input) 
        @movie = @search.fetch 
#byebug
        self.title = @movie[0]["original_title"]
        self.poster =  @movie[0]["poster_path"]
        self.release_date = @movie[0]["release_date"]
    end
end
