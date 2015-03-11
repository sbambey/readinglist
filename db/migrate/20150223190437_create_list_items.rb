class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.text :title
      t.text :author
      t.string :isbn
      t.boolean :is_ebook
      t.text :website
      t.text :image_link
      t.text :categories
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
