class MoviesController < ApplicationController

    def index 
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])

        #Review.create(user_id: @current_user.id, movie_id: @movie.id, rating: params[:review][:rating], content: params[:review][:content])
        #redirect_to user_path(@current_user)
    end
end
