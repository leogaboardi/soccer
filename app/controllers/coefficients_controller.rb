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

  def update_prediction
    #Updates attendance prediction for all matches
    @match = Match.find(1)
    count = 0
    #@matches.each do |match|
      @match.attendance_prediction = 1 #attendance(@match)
      @match.save
      count = count+1
    #end
    redirect_to "/coefficients", :notice => "Prediction updated successfully. " +count.to_s+" entries updated."

  end

  def attendance(match)
    #this method estimates the attendance based on the coefficients table
    @used_coefs = {}

    def new_coefficient(name)
      #This method looks for a coefficient in the table with the inputed name
      coefficients = Coefficient.where(:scope => "attendance")
      if !coefficients.find_by(:name => name).blank?
        @used_coefs[name]=coefficients.find_by(:name => name).value
      end
    end

    #Build a hash comprising of meaningful coefficients for this particular match
    new_coefficient("intercept") #Intercept
    new_coefficient("home.team"+match.home_team.name) #Home team
    new_coefficient("away.team"+match.away_team.name) #Away team
    new_coefficient("venue"+match.venue.name) #Venue
    new_coefficient("round")#Round
    @used_coefs["round"] = @used_coefs["round"]*match.round

    if !match.match_at.nil?
      new_coefficient("timeOfDay"+match.match_at.strftime("%H:%M")) #Time of day
    end

    if !match.match_on.nil?
      new_coefficient("weekday"+match.match_on.strftime("%A")) #Weekday
    end

    #second division (division 2)

    #Home days since last match
    #Away days since last match
    #Home previous match result
      #Not implemented yet!
      #new_coefficient("home.previousmatch.result")
      #@used_coefs[name] = @used_coefs[name]

    #Away previous match result
      #Not implemented yet!
      #new_coefficient("away.previousmatch.result")
      #@used_coefs[name] = @used_coefs[name]

    #new_coefficient("home.standing") #Home standing
    #@used_coefs["home.standing"] = @used_coefs["home.standing"]*match.home_standing

    #new_coefficient("away.standing") #Away standing
    #@used_coefs["away.standing"] = @used_coefs["away.standing"]*match.away_standing

    #Calculate the projection
    attendance_projection = 0
    @used_coefs.each do |name,value|
      attendance_projection = attendance_projection + value
    end
    attendance_projection = (Math.exp(attendance_projection)/100).round(0)*100
    return attendance_projection
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
