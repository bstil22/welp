require 'csv'
require 'rest_client'
CSV.foreach("public/restaurants.csv") do |row|
  if row[6] != nil
    Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: row[8], latitude: row[6], longitude: row[7]) 
  else
      @insert = "#{row[2]} #{row[3]} #{row[4]} #{row[5]}".gsub(' ', '+')
      @response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=' + @insert + '&key=AIzaSyB76aRrgWJ62eqpv1OQT8EFOuZjLpoX4JM'
      @b =  JSON.parse(@response)
      if @b["status"] == "OK"
      Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: row[8], latitude: @b["results"][0]["geometry"]["location"]["lat"], longitude: @b["results"][0]["geometry"]["location"]["lng"])
    end
  end
end