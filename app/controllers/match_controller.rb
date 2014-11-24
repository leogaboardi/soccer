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
    @match.name = params[:name]
    @match.label = params[:label]
    @match.logo = params[:image_url]

    @match.save
    @alert_create = true
    render("show")

  end

  def edit_form
    @match = Match.find(params[:id])
  end

  def update_row
    @match = Match.find(params[:id])
    @match.name = params[:name]
    @match.label = params[:label]
    @match.logo = params[:image_url]

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
