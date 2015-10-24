require 'csv'

desc "Imports a CSV file into an ActiveRecord table"
task :violation_import, [:filename] => :environment do    
  
  CSV.foreach('violations.csv', :headers => true) do |row|
    LouViolation.create!(row.to_hash)
    end
end