class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.all.sort{|a, b| b.followers.size <=> a.followers.size}
    end

    def show
        @user = User.find(params[:id])
        @movies = Movie.all
    end

    def new 
        @user = User.new
    end

    def create 
        user = User.create(s_params)


        if user.valid?
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end 
    end

    def follow
        @user = User.find_by(id: params[:id])
        @current_user.followees << @user 
        redirect_to user_path(@user)
        #render :show   ## either ways works !
    end 

    def unfollow
        @user = User.find_by(id: params[:id])
        @current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_to user_path(@user)
    end

    def followers_list
        @user = User.find_by(id: params[:id])

    end 

    def followees_list
        @user = User.find_by(id: params[:id])
    end 

    private

    def s_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end


end
