class Coefficient < ActiveRecord::Base
  belongs_to :user
  validates :scope, :user_id, :presence => true
  validates :value, :numericality => true

end
