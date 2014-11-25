class HomeTeam < ActiveRecord::Base
  has_many(:matches, { :class_name => "Match", :foreign_key => "match_id" })
  belongs_to(:team, { :class_name => "Team", :foreign_key => "team_id" })
end
