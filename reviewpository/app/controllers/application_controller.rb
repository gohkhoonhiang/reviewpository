class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :back_url, :prev_search
  before_filter :require_login

  def current_user
    @current_user ||= User.find_by(username: session[:username])
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    unless current_user
      flash[:login] = "Please login first"
      redirect_to root_url
    end
  end

  def back_url
    session[:back_url] ||= "/"
  end

  def prev_search
    session[:prev_search] ||= ""
  end
end
