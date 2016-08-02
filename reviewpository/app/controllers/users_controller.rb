class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to login_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
