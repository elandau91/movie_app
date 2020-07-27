class SessionsController < ApplicationController
    
    def new

    end 

    def create
        session[:username] = params[:username]
        redirect_to '/movies'
    end 

    def destroy
        session.delete :username 
    end
end