class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protected
    def authorize
        unless User.find_by(id: session[:user_id])
         redirect_to login_url notice: "Please login"
        end
    end
end
