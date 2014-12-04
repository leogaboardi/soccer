class TeamController < ApplicationController
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
    @team = Team.order("label")
  end

  def show
    @team = Team.find(params[:id])
  end

  def new_form
    @team = Team.new
  end

  def create_row
    @team = Team.new
    @team.name = params[:name]
    @team.label = params[:label]
    @team.crest = params[:crest_url]

    if @team.save
      redirect_to "/teams", :notice => "Team created successfully."
    else
      render "new_form"
    end

  end

  def edit_form
    @team = Team.find(params[:id])
  end

  def update_row
    @team = Team.find(params[:id])
    @team.name = params[:name]
    @team.label = params[:label]
    @team.crest = params[:crest_url]

    if @team.save
      redirect_to "/teams", :notice => "Team updated successfully."
    else
      render "edit_form"
    end

  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to "/teams", :notice => "Team deleted."
  end
end
