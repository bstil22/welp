class Restaurant < ActiveRecord::Base
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  searchkick text_start: [:name]
  Restaurant.reindex
end