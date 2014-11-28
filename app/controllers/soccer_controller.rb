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

    #This part calculates the progress bar
    @total_count = @match.bets.count
    if @total_count != 0
      @home_count = @match.bets.where({:bet => 1}).count.to_f
      @draw_count = @match.bets.where({:bet => 0}).count.to_f
      @away_count = @match.bets.where({:bet => -1}).count.to_f
    else
      @total_count = 1
      @home_count = 0
      @draw_count = 0
      @away_count = 0
    end

    #This variable checks where to put the "you" badge next to the progress bar
    @user_bet = @match.bets.where({:user_id => params[:user_id]}).first.bet

    render("match_show")
  end

  def match_show
    @match = Match.find(params[:match_id])

    #This part calculates the progress bar
    @total_count = @match.bets.count
    if @total_count != 0
      @home_count = @match.bets.where({:bet => 1}).count.to_f
      @draw_count = @match.bets.where({:bet => 0}).count.to_f
      @away_count = @match.bets.where({:bet => -1}).count.to_f
    else
      @total_count = 0.01
      @home_count = 0
      @draw_count = 0
      @away_count = 0
    end

    #This variable checks where to put the "you" badge next to the progress bar
    user_id = 1

    #Check if the user made a bet for this match
    if @match.bets.where({:user_id => user_id}).count==0
      @user_bet = nil
    else
      @user_bet = @match.bets.where({:user_id => user_id}).first.bet
    end
  end


  def current_matches
    @match = Match.find(params[:id])
    first_match_id = Match.where({:outcome => nil}).order("id").first.id
    last_match_id = Match.where({:outcome => nil}).order("id").last.id


    #Check if this match has the lowest ID among the current matches
    if @match.id != first_match_id
      @previous = Match.where({:outcome => nil}).where("id < ?", params[:id]).last.id
    else
      @previous = last_match_id
    end

    #Check if this match has the highest ID among the current matches
    if @match.id != last_match_id
      @next = Match.where({:outcome => nil}).where("id > ?", params[:id]).first.id
    else
      @next = first_match_id
    end
  end

  def past_index
    @page_name = "Past results"
    @match = Match.where({:outcome => [-1,0,1]}).order("match_at")
    @link = "past/"
    render("match_index")
  end

  def current_index
    @page_name = "Your current bets"
    @bet = Bet.where({:user_id => 1}).order("match_id")
    @match = Match.where({:outcome => nil}).order("match_at")
    @link = "/current/bet/"
    render("match_index")
  end
end
