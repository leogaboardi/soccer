class SoccerController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index

  end

  def faq

  end


  def current_bets
    @current_id = params[:current_id]
    @bet = params[:bet]
    @tournament = "Campeonato Brasileiro 2014 - 1st division"
    @round_name = "Round 25"

    @date = "Sep 28th, 2014 6:30pm - Orlando Scarpelli (SC)"
    @home_team ="http://cdn.cbf.com.br/cbf/imagens/escudos/00010sc.jpg"
    @away_team ="http://cdn.cbf.com.br/cbf/imagens/escudos/00019sp.jpg"
  end

  def current_matches
    @current_id = params[:current_id]

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
