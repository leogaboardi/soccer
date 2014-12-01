class SoccerController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!

  def current_match_link

    if current_user.present?
      #Put a link to a random match which did not occur and

      # Get an array of bets whose user equals to current user
      @bet = Bet.where({:user_id => current_user.id})
      @bet_ids = @bet.pluck(:match_id)

      # Randomise the match order
      @random_match = Match.where({:outcome => nil }).order("RANDOM()")

      # Check each match if they are in the current_user bet list
      #The way the loop has been set up, the link will be the last item from the random order
      @random_match.each do |match|
        if not @bet_ids.include? match.id
          @match_link = match.id
        end
      end
      #If there is no match which the user has not bet yet, then there is a special page
      if @match_link == nil
        @match_link = "done"
      end
    end

  end

  def no_bet_left
    current_match_link
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

    current_match_link
  end


  def current_matches
    @match = Match.find(params[:id])

    @current_matches = Match.where({:outcome => nil}).order("id")

    @bet = Bet.where({:user_id => current_user.id}).order("match_id")
    @bet_ids = @bet.pluck(:match_id)

    #Need to find a way to not show matches whose bets have alredy been placed by the user

    first_match_id = @current_matches.first.id
    last_match_id = @current_matches.last.id


    #Check if this match has the lowest ID among the current matches
    if @match.id != first_match_id
      @previous = @current_matches.where("id < ?", params[:id]).last.id
    else
      @previous = last_match_id
    end

    #Check if this match has the highest ID among the current matches
    if @match.id != last_match_id
      @next = @current_matches.where("id > ?", params[:id]).first.id
    else
      @next = first_match_id
    end

    current_match_link
  end

  def past_index
    @page_name = "Past results"
    @match = Match.where({:outcome => [-1,0,1]}).order("match_at")
    @link = "past/"
    render("match_index")
  end

  def current_index
    @page_name = "Your current bets"
    #This index is filtered by matches that the user actually bet on and did not occur yet

    # Get an array of bets whose user equals to current user
    @bet = Bet.where({:user_id => current_user.id}).order("match_id")
    @bet_ids = @bet.pluck(:match_id)

    # Use the bet IDs to filter Matches
    @match = Match.where({:id => @bet_ids, :outcome => nil }).order("match_at")
    @link = "/current/bet/"
    render("match_index")
  end
end
