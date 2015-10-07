require 'csv'

namespace :db do
  task :import_csv => :environment do
    CSV.foreach("violations.csv", :headers => true) do |row|
      LouViolation.create!(row.to_hash)
    end
  end
end