class UserController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new_form
    @user = User.new
  end

  def create_row
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email].downcase
    @user.admin = params[:admin]

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render "new_form"
    end

  end

  def edit_form
    @user = User.find(params[:id])
  end

  def update_row
    @user = User.find(params[:id])
    @user.username = params[:username]
    @user.email = params[:email]
    @user.admin = params[:admin]
    @user.save

    if @user.save
      redirect_to "/users", :notice => "User updated successfully."
    else
      render "edit_form"
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @alert_destroy = true
  end
end
