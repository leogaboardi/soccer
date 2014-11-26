class User < ActiveRecord::Base
  has_many :bets

  validates :username, :presence => true
  validates :email, :presence => true, :uniqueness => true

end
