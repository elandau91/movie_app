class ReviewsController < ApplicationController
    def new 
        @review = Review.new
        @movies = Movie.all
        @users = User.all  
    end
    #need refactoring!! (with strong params)
    def create 

        #byebug

        if params[:title] != nil
            @movie = Movie.create(title: params[:title].keys.join(""), poster: params[:poster].keys.join(""), release_date: params[:release_date].keys.join(""))
            @review = Review.create(user_id: @current_user.id, movie_id: @movie.id, rating: params[:review][:rating], content: params[:review][:content])
        else
        #byebug

            @review = Review.create(user_id: @current_user.id, movie_id: params[:review][:movie_id], rating: params[:review][:rating], content: params[:review][:content])
        end
        redirect_to movie_path(@review.movie)

    end

    def edit
        @movies = Movie.all
        @review = Review.find_by(id: params[:id])
    end 

    def update
        @review = Review.find_by(id: params[:id])
        @review.update(user_id: @current_user.id, movie_id: params[:review][:movie_id], rating: params[:review][:rating], content: params[:review][:content])
        redirect_to user_path(@current_user)
    end

    def destroy

        @review = Review.find_by(id: params[:id]).destroy 
        redirect_to user_path(@current_user)
    end

    private

    def s_params
        params.require(:review).permit(:user_id, :movie_id, :rating, :content)
    end
end
