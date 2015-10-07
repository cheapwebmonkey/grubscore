class LouInspections < ActiveRecord::Migration
  def change
    rename_column :lou_inspections, :type, :visit
  end
end
