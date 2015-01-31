class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bets
  has_many :matches
  has_many :coefficients

  validates :username, :presence => true, :uniqueness => true
  before_destroy  :at_least_one_admin

  def at_least_one_admin
    if email == "leonardo@example.com"
      errors.add(username, " can't be deleted")
      return false
    end
  end
end
