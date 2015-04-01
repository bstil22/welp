class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :title
      t.text :body
      t.integer :restaurant_id
      t.integer :user_id
      t.integer :rating
    end
  end
end
