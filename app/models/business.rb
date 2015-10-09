class Business < ActiveRecord::Base
  require 'csv'
  has_many :lou_inspections
  has_many :lou_violations
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    "#{address}, #{postal_code}, #{city}, #{state}"
  end
  
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
