class Business < ActiveRecord::Base
  require 'csv'
  self.primary_key = 'business_id'
  has_many :lou_inspections
  has_many :lou_violations
  validates_uniqueness_of :business_id
  scope :business_id, -> {where("business_id >= ?", 1)}
  scope :newest, -> {order("created_at DESC")}

  #defining a new function :starts_with which will pass in a (letter) which it uses to perform a search
  scope :starts_with, ->(letter) { where("name LIKE ?", letter + "%")}
  
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    "#{address}, #{postal_code}, #{city}, #{state}"
  end

  # def update_rating!
  #   update_attributes(
  #     score: )
  # end
  
end
  
  #def self.import(file)
    #CSV.foreach(file.path, headers: true) do |row|

      #product_hash = row.to_hash # exclude the price field
      #product = Product.where(id: product_hash["id"])

      #if product.count == 1
       # product.first.update_attributes(product_hash)
      #else
        #Product.create!(product_hash)
      #end # end if !product.nil?
    #end # end CSV.foreach
  #end # end self.import(file)
#end # end class
