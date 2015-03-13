class CreateBookRequests < ActiveRecord::Migration
  def change
    create_table :book_requests do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
