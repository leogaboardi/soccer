class BetController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @bet = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new_form

  end

  def create_row
    @bet = Bet.new
    @bet.match_id = params[:match_id]
    @bet.user_id = params[:user_id]
    @bet.guess = params[:guess]

    @bet.save
    @alert_create = true
    render("show")

  end

  def edit_form
    @bet = Bet.find(params[:id])
  end

  def update_row
    @bet = Bet.find(params[:id])
    @bet.match_id = params[:match_id]
    @bet.user_id = params[:user_id]
    @bet.guess = params[:guess]

    @bet.save
    @alert_update = true
    render("show")

  end

  def destroy
    @team = Bet.find(params[:id])
    @team.destroy
    @alert_destroy = true
  end
end
