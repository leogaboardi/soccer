class BetController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!

  def index
    @bet = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new_form
    @bet = Bet.new
  end

  def create_row
    @bet = Bet.new
    @bet.match_id = params[:match_id]
    @bet.user_id = params[:user_id]
    @bet.bet = params[:bet]

    if @bet.save
      redirect_to "/bets", :notice => "Bet created successfully."
    else
      render "new_form"
    end

  end

  def edit_form
    @bet = Bet.find(params[:id])
  end

  def update_row
    @bet = Bet.find(params[:id])
    @bet.match_id = params[:match_id]
    @bet.user_id = params[:user_id]
    @bet.bet = params[:bet]

    if @bet.save
      redirect_to "/bets", :notice => "Bet updated successfully."
    else
      render "edit_form"
    end

  end

  def destroy
    @team = Bet.find(params[:id])
    @team.destroy
    @alert_destroy = true
  end
end
