class LouViolation < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  has_many :business
  belongs_to :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order("created_at DESC")}
  


end

def index
	  @lou_violations = LouViolation.all.paginates_per 50

end