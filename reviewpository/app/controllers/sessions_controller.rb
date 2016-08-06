class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if !user.nil? && user.authenticate(params[:password])
      session[:username] = params[:username]
      redirect_to user_items_url
    else
      flash[:login] = "Invalid username or password"
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
