#Used rails generate migration add_index_violations for this

class AddIndexInspections < ActiveRecord::Migration
  def change
    add_index  :lou_inspections, :business_id
  end
end

