class DeleteRaty3 < ActiveRecord::Migration
  def change
    drop_table :rates
  end
end
