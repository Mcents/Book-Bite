class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to books_path
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:notice] = "Goodbye"
    redirect_to root_path
  end
end
