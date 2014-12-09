class Venue < ActiveRecord::Base
  has_many :matches
  validates :name, :label, :presence => true, :uniqueness => true

end
