class Team < ActiveRecord::Base
  has_many(:home_teams, { :class_name => "Match", :foreign_key => "home_team_id" })
  has_many(:away_teams, { :class_name => "Match", :foreign_key => "away_team_id" })

  validates :name, :presence => true, :uniqueness => true
  validates :label, :presence => true, :uniqueness => true

end
