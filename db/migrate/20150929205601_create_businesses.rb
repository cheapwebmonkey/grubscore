class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      #make a var char with the columns name/title
      t.integer :business_id
      t.string :name, :address, :city, :state
      t.integer :postal_code
      t.float :latitude, :longitude
      t.string :phone_number
      t.timestamps null: false
      
      # reverse_geocoded_by :latitude, :longitude
      # after_validation :reverse_geocode 
    end
  end
end
