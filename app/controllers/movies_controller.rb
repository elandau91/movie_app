Tmdb::Api.key("a9906c88d9a679228d60881374c08beb")
Tmdb::Api.language("en")

class MoviesController < ApplicationController

 eli_edits
    def search
        @query = params[:query]

        @results = get_results(@query) if @query && !@query.empty?

        render :search
    end






    private

    def get_results (query)
        @search = Tmdb::Search.new
        @search.resource('movie') 
        @search.query(query) 
        @movie = @search.fetch 

    end


    def index 
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end

end
