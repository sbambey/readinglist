class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :slug, unique: true
      t.integer :list_id

      t.timestamps null: false
    end
    add_index :short_urls, :slug, unique: true
  end
end
