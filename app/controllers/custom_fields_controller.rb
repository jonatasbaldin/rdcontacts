class CustomFieldsController < ApplicationController
  before_action :session_right_user, only: [:edit, :update, :index, :show]

  def index
    @user = User.find(params[:user_id])
    @custom_field = @user.custom_field.all
    @page_title = 'All Custom Fields'
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @custom_field = @user.custom_field.new
    @form_params = { head_title: "Add a custom field", submit_message: "Add",
                     form_path: user_custom_fields_path, form_method: :post }
    @page_title = 'New Custom Field'

    render 'layouts/_customfields_form'
  end

  def edit
    @user = User.find(params[:user_id])
    @custom_field = @user.custom_field.find(params[:id])
    @form_params = { head_title: "Edit custom field", submit_message: "Edit",
                     form_path: user_custom_field_path, form_method: :patch }
    @page_title = 'Edit Custom Field'

    render 'layouts/_customfields_form'
  end

  def create
    @user = User.find(params[:user_id])
    @custom_field = @user.custom_field.build(custom_field_params)
    if @custom_field.save
      redirect_to user_custom_fields_path(@user)
    else
      @form_params = { head_title: "Add a custom field", submit_message: "Add",
                       form_path: user_custom_fields_path, form_method: :post }
      @page_title = 'Add Custom Field'
      render 'layouts/_customfields_form'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @custom_field = @user.custom_field.find(params[:id])

    if @custom_field.update_attributes(custom_field_params)
      redirect_to user_custom_fields_path(@user)
    else
      @form_params = { head_title: "Edit custom field", submit_message: "Edit",
                       form_path: user_custom_field_path, form_method: :patch }
      @page_title = 'Edit Custom Field'
      render 'layouts/_customfields_form'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @custom_field = @user.custom_field.find(params[:id])
    @custom_field.destroy

    redirect_to user_custom_fields_path(@user)
  end

  private
    def custom_field_params
      params.require(:custom_field).permit(:name, :style)
    end
end
