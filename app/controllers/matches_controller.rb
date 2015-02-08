class MatchesController < ApplicationController
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
    @match = Match.all
  end

  def show
    @match = Match.find(params[:id])
    attendance(@match)
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new

    @match.tournament = params[:tournament]
    @match.round = params[:round]
    @match.match_on = params[:match_on]
    @match.match_at = params[:match_at]
    @match.venue_id = params[:venue_id]
    @match.home_team_id = params[:home_team_id]
    @match.away_team_id = params[:away_team_id]
    @match.home_goal = params[:home_goal]
    @match.away_goal = params[:away_goal]
    @match.user_id = params[:user_id]

    if @match.home_team_id!=nil and @match.away_team_id!=nil
      @match.label =  @match.home_team.label +  " x " + @match.away_team.label
    end

    if @match.home_goal!=nil and @match.home_goal!=nil
      if @match.home_goal > @match.away_goal
        @match.outcome = 1
      elsif @match.home_goal < @match.away_goal
        @match.outcome = -1
      else
        @match.outcome = 0
      end
    end

    if @match.save
      redirect_to "/matches", :notice => "Match created successfully."
    else
      render "new_form"
    end

  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.tournament = params[:tournament]
    @match.round = params[:round]
    @match.match_on = params[:match_on]
    @match.match_at = params[:match_at]
    @match.venue_id = params[:venue_id]
    @match.home_team_id = params[:home_team_id]
    @match.away_team_id = params[:away_team_id]
    @match.home_goal = params[:home_goal]
    @match.away_goal = params[:away_goal]
    @match.user_id = params[:user_id]

    if @match.home_team_id!=nil and @match.away_team_id!=nil
      @match.label =  @match.home_team.label +  " x " + @match.away_team.label
    end


    if @match.home_goal!=nil and @match.home_goal!=nil
      if @match.home_goal > @match.away_goal
        @match.outcome = 1
      elsif @match.home_goal < @match.away_goal
        @match.outcome = -1
      else
        @match.outcome = 0
      end
    end

    if @match.save
      redirect_to "/matches", :notice => "Match updated successfully."
    else
      render "edit_form"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to "/matches", :notice => "Match deleted."
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
end
