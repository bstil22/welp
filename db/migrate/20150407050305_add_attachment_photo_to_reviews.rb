class AddAttachmentPhotoToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :reviews, :photo
  end
end
