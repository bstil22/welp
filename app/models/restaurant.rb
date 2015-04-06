class Restaurant < ActiveRecord::Base
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  searchkick word_start: [:name]
  def yelp_call
      coordinates = { latitude: self.latitude, longitude: self.longitude }
      json = Yelp.client.search_by_coordinates(coordinates).to_json
      a = JSON.parse(json)
      print a
    end
end
