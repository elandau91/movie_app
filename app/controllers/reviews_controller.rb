class ReviewsController < ApplicationController
    def new 
        @review = Review.new
        @movies = Movie.all
        @users = User.all  
    end
    #need refactoring!! (with strong params)
    def create 
        Review.create(user_id: @current_user.id, movie_id: params[:review][:movie_id], rating: params[:review][:rating], content: params[:review][:content])
        redirect_to user_path(@current_user)
    end

    def add_to_favorite
        
    end

    private

    def s_params
        params.require(:review).permit(:user_id, :movie_id, :rating, :content)
    end
end
