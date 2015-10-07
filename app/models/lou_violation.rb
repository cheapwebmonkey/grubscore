class LouViolation < ActiveRecord::Base
  require 'csv'
  belongs_to :business
  
  
end
