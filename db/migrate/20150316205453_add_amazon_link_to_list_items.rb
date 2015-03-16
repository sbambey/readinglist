class AddAmazonLinkToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :amazon_link, :text
  end
end
