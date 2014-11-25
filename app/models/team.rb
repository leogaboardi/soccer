class Team < ActiveRecord::Base
  has_many(:home_team, { :class_name => "HomeTeam", :foreign_key => "home_team_id" })
  has_many(:away_team, { :class_name => "AwayTeam", :foreign_key => "away_team_id" })
  #belongs_to(:home_team, { :class_name => "Team", :foreign_key => "home_team_id" }))
  #belongs_to(:away_team, { :class_name => "Team", :foreign_key => "away_team_id" }))

end
