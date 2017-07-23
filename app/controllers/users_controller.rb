class UsersController < ApplicationController
skip_before_action :require_login, :only => [:new, :create]
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.username}"
    redirect_to root_path
    else
      flash[:notice] = "Invalid Credentials"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name)
  end

end
