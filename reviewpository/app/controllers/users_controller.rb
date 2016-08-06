class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render :new
    end
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.authenticate(user_params[:old_password])
      if user_params[:email] != nil && !user_params[:email].empty?
        @user.update_attribute(:email, user_params[:email])
      end
      if user_params[:password] != nil && !user_params[:password].empty?
        @user.update_attribute(:password, user_params[:password])
      end
    end
    if user_params[:avatar] != nil
      @user.update_attribute(:avatar, user_params[:avatar])
    end
    redirect_to "/account/settings"
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :old_password)
  end
end
