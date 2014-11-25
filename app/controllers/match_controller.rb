class MatchController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @match = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @home_team = HomeTeam.find_by({:match_id => params[:id]})
    @away_team = AwayTeam.find_by({:match_id => params[:id]})
  end

  def new_form

  end

  def create_row
    @match = Match.new

    @match.tournament = params[:tournament]
    @match.round = params[:round]
    @match.date = params[:date]
    @match.time = params[:time]
    @match.venue = params[:venue]

    @home_team = HomeTeam.new
    @home_team.team_id = params[:home_team_id]
    @home_team.match_id = @match.id
    @match.home_team_id = @home_team.id

    @away_team = AwayTeam.new
    @away_team.team_id = params[:away_team_id]
    @away_team.match_id = @match.id
    @match.away_team_id = @away_team.id

    @match.home_goal = params[:home_goal]
    @match.away_goal = params[:away_goal]
    #@match.user_id =
    #@match.outcome =

    @home_team.save
    @away_team.save
    @match.save
    @alert_create = true
    render("show")

  end

  def edit_form
    @match = Match.find(params[:id])
  end

  def update_row
    @match = Match.find(params[:id])
    @match.tournament = params[:tournament]
    @match.round = params[:round]
    @match.date = params[:date]
    @match.time = params[:time]
    @match.venue = params[:venue]
    @match.home_team_id = params[:home_team_id]
    @match.away_team_id = params[:away_team_id]
    @match.home_goal = params[:home_goal]
    @match.away_goal = params[:away_goal]
    #@match.user_id =
    #@match.outcome =

    @match.save
    @alert_update = true
    render("show")

  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    @alert_destroy = true
  end
end
