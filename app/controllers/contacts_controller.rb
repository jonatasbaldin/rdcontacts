class ContactsController < ApplicationController
  before_action :session_right_user, only: [:edit, :update, :index, :show]

  def index
    @user = User.find(params[:user_id])
    @contact = @user.contact.all
    @page_title = 'All Contacts'

    @custom_f = @user.custom_field
    # Get field just if there's a contact
    unless @contact.nil?
      @custom_field_info = CustomFieldInfo.all
    end

  end

  def show
    @user = User.find(params[:user_id])
    @contact = @user.contact.find(params[:id])
    @page_title = 'Contact'
  end

  def new
    @user = User.find(params[:user_id])
    @contact = @user.contact.new
    @form_params = { head_title: "Add a new contact", submit_message: "Add", form_path: user_contacts_path, form_method: :post }
    @page_title = 'New Contact'

    @custom_f = @user.custom_field
    # Get field just if there's a contact
    unless @contact.nil?
      @custom_field_info = @contact.custom_field_info
    end

    render 'layouts/_contacts_form'
  end

  def edit
    @user = User.find(params[:user_id])
    @contact = @user.contact.find(params[:id])
    @form_params = { head_title: "Edit contact", submit_message: "Edit",
                     form_path: user_contact_path, form_method: :patch }
    @page_title = 'Edit Contact'

    @custom_f = @user.custom_field
    # Get field just if there's a contact
    unless @contact.nil?
      @custom_field_info = @contact.custom_field_info
    end

    render 'layouts/_contacts_form'
  end

  def create
    @user = User.find(params[:user_id])
    @contact = @user.contact.build(contact_params)

    # Prototype of how custom fields info should be edited
    #@custom_f = @user.custom_field
    # Get field just if there's a contact
    #unless @contact.nil?
    #  @custom_field_info = @contact.custom_field_info
    #end

    if @contact.save
      redirect_to user_contacts_path(@user)
    else
      @form_params = { head_title: "Add a new contact", submit_message: "Add",
                       form_path: user_contacts_path, form_method: :post }
      @page_title = 'New Contact'

      render 'layouts/_contacts_form'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @contact = @user.contact.find(params[:id])

    # Prototype of how custom fields info should be edited
    #@custom_f = @user.custom_field
    # Get field just if there's a contact
    #unless @contact.nil?
    #  @custom_field_info = @contact.custom_field_info
    #end

    if @contact.update_attributes(contact_params)
      redirect_to user_contacts_path(@user)
    else
      @form_params = { head_title: "Edit contact", submit_message: "Edit",
                       form_path: user_contact_path, form_method: :patch }
      @page_title = 'Edit Contact'

      render 'layouts/_contacts_form'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @contact = @user.contact.find(params[:id])
    @contact.destroy
    redirect_to user_contacts_path(@user)
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :lastname, :email)
    end
end
