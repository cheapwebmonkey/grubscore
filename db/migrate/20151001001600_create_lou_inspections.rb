class CreateLouInspections < ActiveRecord::Migration
  def change
    create_table :lou_inspections do |t|
      t.integer :business_id, :score
      t.date :date
      t.string :visit

      t.timestamps null: false
    end
  end
end
