class LouInspection < ActiveRecord::Base
  require 'csv'
  belongs_to :business
end
