class CreateBusinessScores < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.timestamps null: false
    end
 
    create_table :lou_inspections do |t|
      t.string :name
      t.timestamps null: false
    end
 
    create_table : do |t|
      t.belongs_to :business, index: true
      t.belongs_to :lou_inspection, index: true
      t.int :score
      t.timestamps null: false
    end
  end
end
