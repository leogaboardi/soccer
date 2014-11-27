class MatchController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @match = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new_form

  end

  def create_row
    @match = Match.new

    @match.tournament = params[:tournament]
    @match.round = params[:round]
    @match.match_on = params[:match_on]
    @match.match_at = params[:match_at]
    @match.venue = params[:venue]
    @match.home_team_id = params[:home_team_id]
    @match.away_team_id = params[:away_team_id]
    @match.home_goal = params[:home_goal]
    @match.away_goal = params[:away_goal]
    @match.user_id = params[:user_id]

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

  def edit_form
    @match = Match.find(params[:id])
  end

  def update_row
    @match = Match.find(params[:id])
    @match.tournament = params[:tournament]
    @match.round = params[:round]
    @match.match_on = params[:match_on]
    @match.match_at = params[:match_at]
    @match.venue = params[:venue]
    @match.home_team_id = params[:home_team_id]
    @match.away_team_id = params[:away_team_id]
    @match.home_goal = params[:home_goal]
    @match.away_goal = params[:away_goal]
    @match.user_id = params[:user_id]

    if @match.home_goal!=nil and @match.home_goal!=nil
      if @match.home_goal > @match.away_goal
        @match.outcome = 1
      elsif @match.home_goal < @match.away_goal
        @match.outcome = -1
      else
        @match.outcome = 0
      end
    end

    @match.save
    render("show")

  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    @alert_destroy = true
  end
end
