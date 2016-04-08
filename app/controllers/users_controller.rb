class UsersController < ApplicationController
  before_action :session_logged_in_user, only: [:edit, :update, :index, :show]
  before_action :session_right_user,     only: [:edit, :update, :index, :show]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @page_title = 'User'
  end

  def new
    @user = User.new
    @form_params = { head_title: "Create your user account", submit_message: "Done",
                     form_path: users_path, form_method: :post }
    @page_title = 'New account'

    render 'layouts/_users_form'
  end

  def edit
    @user = User.find(params[:id])
    @form_params = { head_title: "Change your profile", submit_message: "Change",
                     form_path: user_path, form_method: :patch }
    @page_title = 'Change your profile'

    render 'layouts/_users_form'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Login (aka create session) automatically after creation
      session_log_in @user
      # Redirect to users#show
      redirect_to @user
    else
      @form_params = { head_title: "Create your user account", submit_message: "Done",
                       form_path: users_path, form_method: :post }
      @page_title = 'New account'

      render 'layouts/_users_form'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      @form_params = { head_title: "Change your profile", submit_message: "Change",
                       form_path: user_path, form_method: :patch }
      @page_title = "Change your profile"

      render 'layouts/_users_form'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  # Methods that don't need to be used as actions
  private
    def user_params
      params.require(:user).permit(:name, :lastname, :email, :password,
                                   :password_confirmation)
    end

    # Get if users is logged
    def logged_in_user
      # If user is not logged (there's no session)
      unless session_is_logged?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    # Check if user is who it claims to be
    def right_user
      @user = User.find(params[:id])
      # Redirect to root_url unless user is logged
      redirect_to(root_url) unless @user == session_logged_user
    end
end
