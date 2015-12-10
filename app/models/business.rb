class Business < ActiveRecord::Base
  require 'csv'
  include Filterable
  has_paper_trail
  #self.primary_key = 'business_id'
  has_many :lou_inspection
  has_many :score, :through => :lou_inspection, :source => :lou_inspection
  has_many :lou_violation
  # has_many :description, through: lou_violation
  
  validates_uniqueness_of :business_id
  validates :name, presence: true
  validates :address, length: { minimum: 3 }
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true

  default_scope ->{ order('created_at') }

  scope :id, ->{where("id >= ?", 1)}
  scope :business_id, -> (business_id) { where business_id: business_id }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  #scope :score, -> {where(:has_score => true).lou_inspection}


  #defining a new function :starts_with which will pass in a (letter) which it uses to perform a search
  scope :starts_with, ->(letter) { where("name LIKE ?", letter + "%")}
  
  accepts_nested_attributes_for :lou_inspection
  
  geocoded_by :full_address
  after_validation :geocode
  

  def index
    #@businesses = Business.all
    @businesses = Business.all.includes(:lou_inspection.score)  
  
  end

  # def score
  #   lou_inspection if has_score? 
  # end

  def show

  end

  def search
    index
    render :index
  end
  
  def score
    Business.all.select(:lou_inspection_score)  
    @business.score = LouInspection.score
      for business.score in 0 ... array.size
        puts "array[#{businiess_score}] = #{array[business_score].inspect}"
      end
  end

    def full_address
      "#{address}, #{postal_code}, #{city}, #{state}"
    end

    def has_inspection_scores?
     
    end
    

    def lou_violations
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
end
