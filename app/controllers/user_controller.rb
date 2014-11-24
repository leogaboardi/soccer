class UserController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new_form

  end

  def create_row
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.admin = params[:admin]

    @user.save
    @alert_create = true
    render("show")
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
    @alert_update = true
    render("show")

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @alert_destroy = true
  end
end
