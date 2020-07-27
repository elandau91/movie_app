class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session #idk exactly what is it, but it fixes the error:"InvalidAuthenticityToken in SessionsController#create"


    private
    
    def require_login 
        return head(:forbidden) unless session.include? :user_id
    end
end
