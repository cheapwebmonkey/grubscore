class Business < ActiveRecord::Base
  require 'csv'
  has_paper_trail
  self.primary_key = 'business_id'
  belongs_to :lou_inspections
  belongs_to :lou_violations
  
  # validates_uniqueness_of :business_id
  validates :name, presence: true
  validates :address, length: { minimum: 3 }

  default_scope ->{ order('created_at') }

  scope :id, -> {where("id >= ?", 1)}
  scope :newest, -> {order("created_at DESC, paginates_per(25)")}
  paginates_per 50


  #defining a new function :starts_with which will pass in a (letter) which it uses to perform a search
  scope :starts_with, ->(letter) { where("name LIKE ?", letter + "%")}
  
  
  geocoded_by :full_address
  after_validation :geocode

  def index
    Business.all.paginates_per 50
    
  end

  
    def full_address
      "#{address}, #{postal_code}, #{city}, #{state}"
    end

    def self.search(search)
      # Title is for the above case, the OP incorrectly had 'name'
      where("name LIKE ?", "%#{search}%")
    end


    def update_rating!
      update_attributes :score
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
