# class Location < ActiveRecord::Base
# 	require 'csv'
# 	has many :business
# 	  geocoded_by :address
# 	  after_validation :geocode, :if => :address_changed?
# end
