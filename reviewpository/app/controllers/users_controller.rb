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
    if @user.update(user_params)
      flash[:notice] = "Account updated"
      redirect_to account_settings_url
    else
      flash.now[:alert] = "Validation errors"
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :old_password)
  end
end
