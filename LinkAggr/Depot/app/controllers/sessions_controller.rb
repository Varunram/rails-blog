class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
      user=User.find_by(name: params[:name])
      if user and user.authenticate(params[:password])
          session[:user_id]=user.id
          redirect_to admin_url
          else
          redirect_to login_url, alert:" Invalid User/Password Combination"
      end
  end

  def destroy
      session[:user_id] = nil
      resirect_to store_url, notice: "Logged out"
  end
end