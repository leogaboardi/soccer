class UserController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!
  before_action :check_if_admin #, only[:index, :create, :update]

  #Checks if current_user is admin, and therefore can play around with the Team table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

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
    if current_user.admin?
      @user.username = params[:username]
      @user.email = params[:email].downcase
      @user.admin = params[:admin]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]

      if @user.save
        redirect_to "/users", :notice => "User created successfully."
      else
        render "new_form"
      end
    end

  end

  def edit_form
    @user = User.find(params[:id])
  end

  def update_row
    @user = User.find(params[:id])
    if current_user.admin?
      @user.username = params[:username]
      @user.email = params[:email]
      @user.admin = params[:admin]

      if @user.save
        redirect_to "/users", :notice => "User updated successfully."
      else
        render "edit_form"
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/users", :notice => "User deleted."
  end
end
