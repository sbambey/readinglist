class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.text :name
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
