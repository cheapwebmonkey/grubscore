class CreateLouViolations < ActiveRecord::Migration
  def change
    create_table :lou_violations do |t|
      t.integer :business_id
      t.date :date
      t.text :description

      t.timestamps null: false
    end
  end
end
