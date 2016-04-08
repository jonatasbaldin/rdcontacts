class SessionsController < ApplicationController

  def new
    @page_title = "Login"
  end

  def create
    # If user exists and authenticates
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session_log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    # Deletes user session
    session_log_out
    redirect_to root_path 
  end

end
