class Restaurant < ActiveRecord::Base
  has_many :reviews
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  searchkick word_start: [:name]
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200>',
    medium: '300x300>'
  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
