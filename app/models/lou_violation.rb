class LouViolation < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  belongs_to :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order("created_at DESC")}
  
  
end
