Tmdb::Api.key("a9906c88d9a679228d60881374c08beb")
Tmdb::Api.language("en")

class MoviesController < ApplicationController


    def index 
        @movies = Movie.all
    end

    def show

        @review = Review.new
        @movie = Movie.find_by(id: params[:id])

        if @movie && @movie.title != params[:name]
            render :show

        elsif Movie.find_by(title: params[:name]) 
            @movie = Movie.find_by(title: params[:name])
            render :show
        else
            @api_movie = Tmdb::Movie.detail(params[:id])
            @movie = Movie.new(title: @api_movie["original_title"], poster: @api_movie["poster_path"], release_date: @api_movie["release_date"])
            
        end
    
        @review = Review.find_or_create_by(user_id: @current_user.id, movie_id: @movie.id)
    end



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



end
