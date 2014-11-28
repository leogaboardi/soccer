class User < ActiveRecord::Base
  has_many :bets
  has_many :matches

  validates :username, :presence => true
  validates :email, :presence => true, :uniqueness => true

end
