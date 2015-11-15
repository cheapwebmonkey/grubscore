class LouInspection < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  # has_many :business
  belongs_to :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order("created_at DESC")}
  scope :ascore, -> {where("score >= ?", 85)}
  scope :cscore, -> {where("score <= ?", 85)}

  accepts_nested_attributes_for :business

 params = { lou_inspection: {
  business_id: 'some number', business_attributes: [
    { name: 'Kari, the awesome Ruby documentation browser!' }
  ]
}}

lou_inspection = LouInspection.create(params[:business])
lou_inspection.business

end

	def index
	  LouInspection.all.paginates_per 50

	end
