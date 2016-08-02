class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_filter :require_login

  def current_user
    @current_user ||= User.find_by(username: session[:username])
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
