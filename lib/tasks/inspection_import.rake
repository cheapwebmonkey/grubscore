require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :inspection_import, [:filename] => :environment do    
  CSV.foreach('inspections.csv', :headers => true) do |row|
    LouInspeciton.create!(row.to_hash)
    end
end