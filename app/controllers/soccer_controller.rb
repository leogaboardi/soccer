class SoccerController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index

  end

  def faq

  end

  def howitworks

  end

  def create_bet
    @bet = Bet.new
    @bet.match_id = params[:match_id]
    @bet.user_id = params[:user_id]
    @bet.bet = params[:bet]

    @bet.save

    @match = Match.find(params[:match_id])
    render("current_bets")
  end

  def current_bets
    @match = Match.find(params[:id])

    @a = Bet.all.count
    @everyone_draw = 4
    @everyone_away = 4

  end

  def current_matches
    @match = Match.find(params[:id])

    @tournament = "Campeonato Brasileiro 2014 - 1st division"
    @round_name = "Round 25"

    @date = "Sep 28th, 2014 6:30pm - Orlando Scarpelli (SC)"
    @home_team ="http://cdn.cbf.com.br/cbf/imagens/escudos/00010sc.jpg"
    @away_team ="http://cdn.cbf.com.br/cbf/imagens/escudos/00019sp.jpg"
  end

  def past_index
    @page = params[:page]
  end
end
