Business.includes(:lou_violations).first(5)



#DO NOT USE TOTALLY INEFFICIENT!
#Business.all.each do |business|
#  puts business.lou_violations.all
#  end
#
#Business.all.each do |business|
#  puts business.lou_violations.count
#  end