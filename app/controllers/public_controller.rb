class PublicController < ApplicationController

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

  def index
    current_match_link
  end

  def about
    current_match_link
  end

  def faq
    current_match_link
  end

  def howitworks
    current_match_link
  end
end
