class CoefficientsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!
  before_action :check_if_admin

  #Checks if current_user is admin, and therefore can play around with the tables
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def index
    @coefficient = Coefficient.all
  end

  def show
    @coefficient = Coefficient.find(params[:id])
  end

  def new
    @coefficient = Coefficient.new
  end

  def create
    @coefficient = Coefficient.new
      @coefficient.user_id = params[:user_id]
      @coefficient.scope = params[:scope]
      @coefficient.name = params[:name]
      @coefficient.value = params[:value]

      if @coefficient.save
        redirect_to "/coefficients", :notice => "Coefficient created successfully."
      else
        render "new_form"
      end

  end

  def edit
    @coefficient = Coefficient.find(params[:id])
  end

  def update
    @coefficient = Coefficient.find(params[:id])
    @coefficient.user_id = params[:user_id]
    @coefficient.scope = params[:scope]
    @coefficient.name = params[:name]
    @coefficient.value = params[:value]

    if @coefficient.save
      redirect_to "/coefficients", :notice => "Coefficient updated successfully."
    else
      render "edit_form"
    end
  end

  def destroy
    @coefficient = Coefficient.find(params[:id])
    @coefficient.destroy
    redirect_to "/coefficients", :notice => "Coefficient deleted successfully."
  end

  def import
    # This method reads a CSV table and populates the coefficients
    # TODO: actually upload the file (currently we are getting only the filename).
    #   Check http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm
    # TODO: check if the CSV has 2 columns, and the second is made of numebers
    # TODO: make the user give an okay to store the table

    @datafile = params[:datafile]
    require 'csv'
    @coef_table = {}
    csv = CSV.foreach(@datafile) do |row|
      name, value = row
      @coef_table[name] = value
    end
  end
end
