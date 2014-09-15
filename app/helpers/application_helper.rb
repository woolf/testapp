module ApplicationHelper

  def logged_in_user
    @logged_in_user
  end

  def user_logged_in?
    if @logged_in_user.nil?
      false
    else
      true
    end
  end

end
