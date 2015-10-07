require 'csv'

namespace :db do
  task :import_csv => :environment do
    CSV.foreach("inspections.csv", :headers => true) do |row|
      LouInspection.create!(row.to_hash)
    end
  end
end