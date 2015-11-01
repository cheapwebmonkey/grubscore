class BusinessList < ActiveRecord::Base
  has_many :businesses

  validates :name, presence: true
  validates :address, length: { minimum: 3 }
  # validates :description, presence: true
  # validates :description, length: { minimum: 5 }
end
