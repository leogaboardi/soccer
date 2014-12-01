class Match < ActiveRecord::Base
  belongs_to(:home_team, { :class_name => "Team", :foreign_key => "home_team_id" })
  belongs_to(:away_team, { :class_name => "Team", :foreign_key => "away_team_id" })
  belongs_to(:creator, { :class_name => "User", :foreign_key => "user_id" })

  has_many :bets

  validates :venue, :home_team_id,:away_team_id,:match_on,  :presence => true
end
