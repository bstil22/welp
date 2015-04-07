class DeleteRaty < ActiveRecord::Migration
  def change
    drop_table :average_caches
  end
end
