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
        @movie.first(1).each do |movie|
            self.title = movie["original_title"]
            self.poster =  movie["poster_path"]
            self.release_date = movie["release_date"]
        end

    end


    def img_config 
        configuration = Tmdb::Configuration.new
        configuration.base_url
        configuration.secure_base_url
        configuration.poster_sizes
    end

end
