class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end

  def create
    if params[:username] && params[:password]
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:username] = params[:username]
        redirect_to "/user/items"
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
