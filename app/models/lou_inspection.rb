class LouInspection < ActiveRecord::Base
  require 'csv'

  has_paper_trail
  belongs_to :business
  has_many :business_score


  # has_many :business_id, through: :business
  # belongs_to :business
  scope :violation, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order(s"created_at DESC")}
  scope :ascore, -> {where("score >= ?", 85)}
  scope :cscore, -> {where("score <= ?", 85)}

  accepts_nested_attributes_for :business

end

	def index
	  @lou_inspections = LouInspection.all

	end

	 def self.search(search)
    if search
      find(:all, conditions: ['business_id || score LIKE ?', "%#{search}%"], order: "created_at DESC")
    else
      find(:all)
    end
  end
