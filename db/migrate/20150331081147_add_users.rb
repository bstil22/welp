class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :first_name, null: false
    t.string :last_name,  null: false
    t.string :email
    t.string :password_digest
    t.datetime :created_at
    t.datetime :updated_at
    end
  end
end
