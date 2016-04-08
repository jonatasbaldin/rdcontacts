module SessionsHelper
  # SessionHelpers will begin with 'session_'
  # Easy to understand

  # The variable @session_logged_user is the logged user (oh rlly)
  # It's available globally

  # Creates a session for a login
  def session_log_in(user)
    session[:user_id] = user.id
  end

  # Log out an user and delete its session
  def session_log_out
    session.delete(:user_id)
    @logged_user = nil
  end

  # Gets logged user
  def session_logged_user
    @logged_user ||= User.find_by(id: session[:user_id])
  end

  # True if user is logged
  def session_is_logged?
    !session_logged_user.nil?
  end

  # Get if users is logged
  def session_logged_in_user
    unless session_is_logged?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  # Check if user is who it claims to be
  def session_right_user
    if params[:user_id]
      @user = User.find(params[:user_id]) 
    else
      @user = User.find(params[:id]) 
    end
    redirect_to(root_url) unless @user == session_logged_user
  end
end
