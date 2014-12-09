class Match < ActiveRecord::Base
  belongs_to(:home_team, { :class_name => "Team", :foreign_key => "home_team_id" })
  belongs_to(:away_team, { :class_name => "Team", :foreign_key => "away_team_id" })
  belongs_to(:creator, { :class_name => "User", :foreign_key => "user_id" })

  belongs_to :venue

  has_many :bets

  validates :venue_id, :home_team_id,:away_team_id,:match_on,  :presence => true
  validate :home_away_different

  def home_away_different
    if home_team_id.present?
      if home_team_id == away_team_id
        errors.add(home_team.label, " can't be play with itself!")
      end
    end
  end
end
