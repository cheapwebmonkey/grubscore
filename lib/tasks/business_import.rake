require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :business_import, [:filename] => :environment do    
  CSV.foreach('businesses.csv', :headers => true) do |row|
    Business.create!(row.to_hash)
    end
end



#require 'csv'
#
#desc 'Import buinesses csv'
#
#namespace :business do
#  task :import, [:filename] => :environment do
#    CSV.foreach("businesses.csv", :headers => true) do |row|
#      Business.create!(row.to_hash)
#    end
#  end
#end

#desc 'Import buinesses csv'
#
#namespace :business do
#  task :import, [:filename] => :environment do
#    CSV.foreach("businesses.csv", :headers => true) do |row|
#      Business.create!(row.to_hash)
#    end
#  end
#end

#namespace :db do
#  desc 'Import businesses'
#  task :import_csv => :environment do
#    
#    require 'csv'
#    
#    csv_file_path = '/businesses.csv'
#      task :import_csv => :environment do
#        CSV.foreach("businesses.csv", :headers => true) do |row|
#          Business.create!(row.to_hash)
#      rake -T
#        end
#    end
#  end
#end




#
#require 'csv'
#
#
#desc "Import csv data into database record"
#
#
#task :csv_table_import, [:dir] => :environment do |task, args|
#
#
#  files = Dir.glob("#{args[:dir]}/*.csv")
#
#
#  files.each_with_index do |file, index|
#
#
#    model_name = file.split('/').last.split('.').first.camelize.singularize
#
#
#    firstline = 0
#
#
#    params_arr = []
#
#
#    keys = {}
#
#
#
#
#    begin
#
#
#      CSV.foreach(file) do |row|      
#
#
#        keys = row if firstline == 0 
#
#
#        params = {}
#
#
#
#
#        keys.each_with_index do |key, i|
#
#
#          if firstline > 0
#
#
#            params[key] = row[i]
#
#
#          else
#
#
#            break
#
#
#          end
#
#
#        end
#
#
#
#
#        firstline = 1 if firstline < 0
#
#
#        params_arr << params if firstline > 0
#
#
#      end
#
#
#    eval(model_name).create(params_arr)
#
#
#    rescue Exception => e
#
#
#      puts "#{e.message} : #{model_name}"
#
#
#    end
#
#
#  end
#
#
#end
#
#
