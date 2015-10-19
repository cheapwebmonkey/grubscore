class AddViolationsToBusiness < ActiveRecord::Migration
  def change
  	add_column :businesses, :description, :text
  	add_column :businesses, :score, :integer
  end
end
