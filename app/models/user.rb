class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :reviews
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200>',
    medium: '300x300>'
  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end