class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.datetime :created_at
      t.datetime :updated_at
      t.string :image_url
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :url
    end
  end
end
