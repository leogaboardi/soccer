class SoccerController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!, except: [:index]

  def current_match_link #Creates the link for the "GUESS A MATCH" button

    if current_user.present?
      #Put a link to the a random match which did not occur yet and the user did not bet yet
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

  def index
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

    current_match_link
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


  def match_bet
    @match = Match.find(params[:id])

    ##### ##### ##### ##### ##### ##### #####
    # Algorithm below populates the PREVIOUS/NEXT buttons with the IDs
    # of matches that did not occur yet, and the user did not bet yet

    #1. Get the array of match IDs which the user has already bet
    @bet = Bet.where({:user_id => current_user.id}).order("match_id")
    @bet_ids = @bet.pluck(:match_id)

    #2. Get the not occured matches
    @current_matches = Match.where({:outcome => nil})

    #3. Get matches that are not in the @bet_ids vector. Sort by ID order
    @current_matches  = @current_matches.where.not({:id => @bet_ids}).order("id")

    #4. Get the first and last IDs (so I can restart in the beginning when I finished going through all arrays)
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

    current_match_link
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

    current_match_link
    render("match_index")
  end
end
