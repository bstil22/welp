require 'csv'
require 'rest_client'
require 'yelp'
CSV.foreach("public/restaurants.csv") do |row|
  if row[6] != nil
    params = { term: row[1],
      limit: 3 }
      coordinates = { latitude: row[6], longitude: row[7] }
      response = Yelp.client.search_by_coordinates(coordinates, params)
      json = JSON.parse(response.to_json)
      if json["businesses"].any? && json["businesses"][0].has_key?("categories") && json["businesses"][0].has_key?("display_phone")
        Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: json["businesses"][0]["display_phone"], latitude: row[6], longitude: row[7],  category: json["businesses"][0]["categories"][0][0])
      else
        Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: row[8], latitude: row[6], longitude: row[7])
      end
  else
        @insert = "#{row[2]} #{row[3]} #{row[4]} #{row[5]}".gsub(' ', '+')
        @response = RestClient.get 'https://maps.googleapis.com/maps/api/geocode/json?address=' + @insert + '&key=AIzaSyB76aRrgWJ62eqpv1OQT8EFOuZjLpoX4JM'
        @b =  JSON.parse(@response)
        if @b["status"] == "OK"
          params = { term: row[1],
            limit: 3 }
            coordinates = { latitude: @b["results"][0]["geometry"]["location"]["lat"], longitude:  @b["results"][0]["geometry"]["location"]["lng"] }
            response = Yelp.client.search_by_coordinates(coordinates, params)
            json = JSON.parse(response.to_json)
            if json["businesses"].any? && json["businesses"][0].has_key?("categories") && json["businesses"][0].has_key?("display_phone")
              Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: json["businesses"][0]["display_phone"] || nil, latitude: @b["results"][0]["geometry"]["location"]["lat"], longitude: @b["results"][0]["geometry"]["location"]["lng"], category: json["businesses"][0]["categories"][0][0] || nil)
            else
              Restaurant.create(name: row[1], address: "#{row[2]} #{row[3]} #{row[4]} #{row[5]}", phone_number: row[8], latitude: @b["results"][0]["geometry"]["location"]["lat"], longitude: @b["results"][0]["geometry"]["location"]["lng"])
            end
          end
        end
      end
