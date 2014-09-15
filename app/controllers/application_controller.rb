class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_logged_user

  def check_logged_user
    if session[:logged_in_user]
      @logged_in_user = User.find_by_id session[:logged_in_user].to_i
    end
  end

  def require_logged_in_user
    if @logged_in_user.nil?
      flash[:notice] = "Please login!"
      redirect_to login_users_path
      return
    end
    true
  end
end

