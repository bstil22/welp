require 'csv'
CSV.foreach("public/restaurants.csv") do |row|
  Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: row[8], latitude: row[6], longitude: row[7]) 
end