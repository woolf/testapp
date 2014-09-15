class UsersController < ApplicationController

  def login
    @user = User.new

    if request.method == "POST"
      user_or_error = User.authorize(params)

      if user_or_error.class == User
        flash[:notice] = "User successfully logged in"
        session[:logged_in_user] = user_or_error.id
        redirect_to root_path
      elsif user_or_error.class == Array
        @user.errors.add user_or_error[0], user_or_error[1]
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:login, :password, :password_confirmation)
    if @user.save
      flash[:notice] = "User successfully created, please login"
      redirect_to login_users_path
    else
      render :new
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
