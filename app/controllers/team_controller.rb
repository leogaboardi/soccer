class TeamController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @team = Team.order("label")
  end

  def show
    @team = Team.find(params[:id])
  end

  def new_form

  end

  def create_row
    @team = Team.new
    @team.name = params[:name]
    @team.label = params[:label]
    @team.crest = params[:crest_url]

    @team.save
    @alert_create = true
    render("show")

  end

  def edit_form
    @team = Team.find(params[:id])
  end

  def update_row
    @team = Team.find(params[:id])
    @team.name = params[:name]
    @team.label = params[:label]
    @team.crest = params[:crest_url]

    @team.save
    @alert_update = true
    render("show")

  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    @alert_destroy = true
  end
end
