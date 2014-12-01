class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to(:match, { :class_name => "Match", :foreign_key => "match_id" })

 # validate :user_match_uniqueness
  validates :user_id, :presence => true
  validates :match_id, :presence => true
  validates :bet, :presence => true
  validates :match_id, uniqueness: {scope: :user_id,message: "already has this user's bet"}

end
