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
      render "new"
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

  def import_form
    # This method reads a CSV table and prints on the HTML.
    # TODO: actually upload the file (currently we are getting only the filename).
    #   Check http://www.tutorialspoint.com/ruby-on-rails/rails-file-uploading.htm
    if params[:datafile] == nil
      redirect_to "/coefficients", :alert => "Need to select a CSV file."
    else
      @coefficient = Coefficient.new
      @datafile = params[:datafile]
      require 'csv'
      @coef_table = {}
      csv = CSV.foreach(@datafile) do |row|
        name, value = row
        @coef_table[name] = value
      end
    end
  end

  def import
    #This method reads a CSV table and populates the Coefficient database
    #Check if the row is already included in the table
    import_form #read the CSV file
    row_counter = 0 #Counter of entries made
    if params[:scope].blank?
      redirect_to "/coefficients", :alert => "Scope can't be blank."
    else
      if params[:replacement].blank?
        redirect_to "/coefficients", :alert => "Replacement can't be blank."
      else
        if params[:replacement] == "Only add new coefficients"
          @coef_table.each do |key,element|
            @coefficient = Coefficient.all
            if @coefficient.where(:name => key, :scope => params[:scope]).blank? #Check if coefficient already exists
              @coefficient = Coefficient.new
              @coefficient.user_id = params[:user_id]
              @coefficient.scope = params[:scope]
              @coefficient.value = element.to_f.round(5)
              @coefficient.name = key
              @coefficient.save
              row_counter += 1
            end
          end
        elsif params[:replacement] == "Update and add coefficients"
          @coef_table.each do |key,element|
            @coefficient = Coefficient.all
            if @coefficient.where(:name => key, :scope => params[:scope]).blank? #Check if coefficient already exists
              @coefficient = Coefficient.new
            else
              @coefficient = @coefficient.where(:scope => params[:scope], :name => key).first
            end
            @coefficient.user_id = params[:user_id]
            @coefficient.scope = params[:scope]
            @coefficient.value = element.to_f.round(5)
            @coefficient.name = key
            @coefficient.save
            row_counter += 1
          end
        elsif params[:replacement] == "Update and add coefficients, delete unused coefficients"
          #First, add all new coefficients.
          @coef_table.each do |key,element|
            @coefficient = Coefficient.all
            if @coefficient.where(:name => key, :scope => params[:scope]).blank? #Check if coefficient already exists
              @coefficient = Coefficient.new
            else
              @coefficient = @coefficient.where(:scope => params[:scope], :name => key).first
            end
            @coefficient.user_id = params[:user_id]
            @coefficient.scope = params[:scope]
            @coefficient.value = element.to_f.round(5)
            @coefficient.name = key
            @coefficient.save
            row_counter += 1
          end
          #Secondly, delete all coefficients that were not part of the new table
          @coefficient = Coefficient.all
          @coefficient.each do |row|
            #For each coefficient on the database, I search if there is a similar
            #coefficient on the CSV table
            if row.scope == params[:scope]
              found = false
              @coef_table.each do |key,element|
                if row.name == key
                  found = true
                end
              end
              if found == false
                row.destroy
              end
            end
          end
        end
        redirect_to "/coefficients", :notice => "Import successful. "+row_counter.to_s+" entries added or modified."
      end
    end
  end
end
