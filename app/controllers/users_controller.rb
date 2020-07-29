class UsersController < ApplicationController

    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
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

    private

    def s_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end


end
