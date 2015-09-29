class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      #make a var char with the columns name/title
      t.string :name, :about
      t.timestamps null: false
    end
  end
end
