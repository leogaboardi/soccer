class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to(:match, { :class_name => "Match", :foreign_key => "match_id" })


  validates :user_id, :presence => true
  validates :match_id, :presence => true
  validates :bet, :presence => true

end
