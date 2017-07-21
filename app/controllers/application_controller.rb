class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :logged_in?
  before_action :require_login
 

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end
